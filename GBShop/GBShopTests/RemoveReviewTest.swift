//
//  RemoveReviewTest.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 28.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class RemoveReviewTest: XCTestCase {

    func testRemoveReview() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let removeReview = RemoveReview(errorParser: ErrorParser(),
                                        sessionManager: session,
                                        queue: DispatchQueue.global(qos: .utility),
                                        baseUrl: baseUrl)

        // When
        // Call system under test
        let removedReview = expectation(description: "review removed")

        removeReview.removeReview(idComment: 123) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                removedReview.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedRemoveReview() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let removeReview = RemoveReview(errorParser: ErrorParser(),
                                        sessionManager: session,
                                        queue: DispatchQueue.global(qos: .utility),
                                        baseUrl: baseUrl)

        // When
        // Call system under test
        let failedRemoveReview = expectation(description: "failed remove review")

        removeReview.removeReview(idComment: 123) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedRemoveReview.fulfill()
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
