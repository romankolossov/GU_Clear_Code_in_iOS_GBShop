//
//  AddToBasketTest.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 04.03.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class AddToBasketTest: XCTestCase {

    func testAddToBasket() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = NetworkConfig.baseUrlGitGB

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let addToBasket = AddToBasket(errorParser: ErrorParser(),
                                      sessionManager: session,
                                      queue: DispatchQueue.global(qos: .utility),
                                      baseUrl: baseUrl)

        // When
        // Call system under test
        let addedToBasket = expectation(description: "product was added to basket")

        addToBasket.addToBasket(idProduct: 123, quantity: 1) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                addedToBasket.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 8.0, handler: nil)
    }

    // MARK: - Negative tests

    func testFailedAddToBasket() throws {
        // Given
        // Initialize test date and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://wrong.url.com"))

        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)

        let addToBasket = AddToBasket(errorParser: ErrorParser(),
                                      sessionManager: session,
                                      queue: DispatchQueue.global(qos: .utility),
                                      baseUrl: baseUrl)

        // When
        // Call system under test
        let failedAddToBasket = expectation(description: "failed to add product to basket")

        addToBasket.addToBasket(idProduct: 123, quantity: 1) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTFail("Must to have failed: \(model)")
            case .failure:
                failedAddToBasket.fulfill()
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
