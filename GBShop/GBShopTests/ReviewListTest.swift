//
//  ReviewListTest.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 28.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ReviewListTest: XCTestCase {

    func testReviewList() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://sheltered-castle-91706.herokuapp.com/"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let reviewList = ReviewList(errorParser: ErrorParser(),
                                    sessionManager: session,
                                    queue: DispatchQueue.global(qos: .utility),
                                    baseUrl: baseUrl)

        // When
        // Call system under test
        let gotReviewList = expectation(description: "got review list")

        reviewList.reviewList(idUser: 1, pageNumber: 1) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                guard let elemrntFirst: ReviewListResultElement = model.first else { return }
                guard let elemrntLast: ReviewListResultElement = model.last else { return }
                XCTAssertEqual(elemrntFirst.idUser, 1)
                XCTAssertEqual(elemrntFirst.idComment, 123)
                XCTAssertEqual(elemrntFirst.commentText, "Хороший ноутбук")
                XCTAssertEqual(elemrntLast.idUser, 1)
                XCTAssertEqual(elemrntLast.idComment, 456)
                XCTAssertEqual(elemrntLast.commentText, "Хорошая мышка")
                gotReviewList.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedReviewList() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let reviewList = ReviewList(errorParser: ErrorParser(),
                                    sessionManager: session,
                                    queue: DispatchQueue.global(qos: .utility),
                                    baseUrl: baseUrl)

        // When
        // Call system under test
        let failedGotReviewListt = expectation(description: "failed to get review list")

        reviewList.reviewList(idUser: 1, pageNumber: 1) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedGotReviewListt.fulfill()
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }
}
