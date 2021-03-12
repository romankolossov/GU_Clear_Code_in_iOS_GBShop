//
//  AddReviewTest.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 28.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class AddReviewTest: XCTestCase {

    func testAddReview() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let addReview = AddReview(errorParser: ErrorParser(),
                                  sessionManager: session,
                                  queue: DispatchQueue.global(qos: .utility),
                                  baseUrl: baseUrl)

        // When
        // Call system under test
        let addedReview = expectation(description: "review added")

        addReview.addReview(idUser: 123, reviewText: "Текст отзыва") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.userMessage, "Ваш отзыв был передан на модерацию")
                addedReview.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedAddReview() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let addReview = AddReview(errorParser: ErrorParser(),
                                  sessionManager: session,
                                  queue: DispatchQueue.global(qos: .utility),
                                  baseUrl: baseUrl)

        // When
        // Call system under test
        let failedAddReview = expectation(description: "failed add review")

        addReview.addReview(idUser: 123, reviewText: "Текст отзыва") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedAddReview.fulfill()
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }
}
