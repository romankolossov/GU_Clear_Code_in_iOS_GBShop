//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 21.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class AuthTests: XCTestCase {

    // MARK: - Positive tests

    func testSignIn() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = NetworkConfig.baseUrlGitGB

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let auth = Auth(errorParser: ErrorParser(),
                                                sessionManager: session,
                                                queue: DispatchQueue.global(qos: .utility),
                                                baseUrl: baseUrl)

        // When
        // Call system under test
        let signedIn = expectation(description: "signed in")

        auth.signIn(userName: "Somebody", password: "mypassword") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.user.login, "geekbrains")
                XCTAssertEqual(model.user.name, "John")
                XCTAssertEqual(model.user.lastname, "Doe")
                XCTAssertEqual(model.user.id, 123)

                signedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedSignIn() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let auth = Auth(errorParser: ErrorParser(),
                                                sessionManager: session,
                                                queue: DispatchQueue.global(qos: .utility),
                                                baseUrl: baseUrl)

        // When
        // Call system under test
        let failedToSignIn = expectation(description: "failed to sign in")

        auth.signIn(userName: "Somebody", password: "mypassword") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedToSignIn.fulfill()
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }
}
