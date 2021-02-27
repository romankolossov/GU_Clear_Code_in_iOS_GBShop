//
//  LogoutTests.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 21.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class LogoutTests: XCTestCase {

    func testLogout() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let logout = Logout(errorParser: ErrorParser(),
                                    sessionManager: session,
                                    queue: DispatchQueue.global(qos: .utility),
                                    baseUrl: baseUrl)

        // When
        // Call system under test
        let loggedOut = expectation(description: "logged out")

        logout.logout(id: "123") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                loggedOut.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedLogIn() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let logout = Logout(errorParser: ErrorParser(),
                                    sessionManager: session,
                                    queue: DispatchQueue.global(qos: .utility),
                                    baseUrl: baseUrl)

        // When
        // Call system under test
        let failedToLogout = expectation(description: "failed to log out")

        logout.logout(id: "123") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedToLogout.fulfill()
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
