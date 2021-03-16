//
//  SignUpTests.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 21.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class SignUpTests: XCTestCase {

    // MARK: - Positive tests

    func testSignUp() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = NetworkConfig.baseUrlGitGB

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let signUp = SignUp(errorParser: ErrorParser(),
                            sessionManager: session,
                            queue: DispatchQueue.global(qos: .utility),
                            baseUrl: baseUrl)

        // When
        // Call system under test
        let signedUp = expectation(description: "signed up")

        signUp.signUp(
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
                XCTAssertEqual(model.userMessage, "Регистрация прошла успешно!")
                signedUp.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedSignUp() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let signUp = SignUp(errorParser: ErrorParser(),
                            sessionManager: session,
                            queue: DispatchQueue.global(qos: .utility),
                            baseUrl: baseUrl)

        // When
        // Call system under test
        let failedToSignUp = expectation(description: "failed to sign up")

        signUp.signUp(
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
                failedToSignUp.fulfill()
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }
}
