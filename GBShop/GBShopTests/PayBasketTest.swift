//
//  PayBasketTest.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 04.03.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class PayBasketTest: XCTestCase {

    func testPayBasket() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = NetworkConfig.baseUrlHeroku

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let paydBasket = PayBasket(errorParser: ErrorParser(),
                                   sessionManager: session,
                                   queue: DispatchQueue.global(qos: .utility),
                                   baseUrl: baseUrl)

        // When
        // Call system under test
        let payedBasket = expectation(description: "basket was payed")

        paydBasket.payBasket(idPayProve: 1) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                payedBasket.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedPayBasket() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let paydBasket = PayBasket(errorParser: ErrorParser(),
                                   sessionManager: session,
                                   queue: DispatchQueue.global(qos: .utility),
                                   baseUrl: baseUrl)

        // When
        // Call system under test
        let failedPaydBasket = expectation(description: "failed to pay basket")

        paydBasket.payBasket(idPayProve: 1) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedPaydBasket.fulfill()
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
