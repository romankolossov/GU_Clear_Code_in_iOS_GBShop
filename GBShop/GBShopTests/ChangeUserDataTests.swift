//
//  ChangeUserDataTests.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 21.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ChangeUserDataTests: XCTestCase {

    // MARK: - Positive tests

    func testChangeUserData() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = NetworkConfig.baseUrlGitGB

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let changeUserData = ChangeUserData(errorParser: ErrorParser(),
                                            sessionManager: session,
                                            queue: DispatchQueue.global(qos: .utility),
                                            baseUrl: baseUrl)

        // When
        // Call system under test
        let changedUserData = expectation(description: "user data changed")

        changeUserData.changeUserData(
            id: "123",
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        ) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                changedUserData.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedChangeUserData() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let changeUserData = ChangeUserData(errorParser: ErrorParser(),
                                            sessionManager: session,
                                            queue: DispatchQueue.global(qos: .utility),
                                            baseUrl: baseUrl)

        // When
        // Call system under test
        let failedToChangeUserData = expectation(description: "failed to change user data")

        changeUserData.changeUserData(
            id: "123",
            userName: "Somebody",
            password: "mypassword",
            email: "some@some.ru",
            gender: "m",
            creditCard: "9872389-2424-234224-234",
            bio: "This is good! I think I will switch to another language"
        ) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedToChangeUserData.fulfill()
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }
}
