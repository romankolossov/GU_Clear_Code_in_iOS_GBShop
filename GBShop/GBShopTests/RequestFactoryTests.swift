//
//  RequestFactoryTests.swift
//  GBShopTests
//
//  Created by Roman Kolosov on 20.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class RequestFactoryTests: XCTestCase {
    
    // MARK: - Test AuthRequestFactory
    
    func testAuthRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let requestFactory = RequestFactory()
        let authFactory: AuthRequestFactory = requestFactory.makeAuthRequestFatory()
        
        // When
        // Call system under test
        let signedIn  = expectation(description: "logged in")
        
        authFactory.login(userName: "Somebody", password: "mypassword") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.user.id, 123)
                signedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    // MARK: - Test SignUpRequestFactory
    
    func testSSignUpRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let requestFactory = RequestFactory()
        let signUpFactory: SignUpRequestFactory = requestFactory.makeSignUpRequestFactory()
        
        // When
        // Call system under test
        let signedUp  = expectation(description: "signed up")
        
        signUpFactory.signUp(id: "123", userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                signedUp.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    // MARK: - Test ChangeUserDataRequestFactory
    
    func testCChangeUserDataRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let requestFactory = RequestFactory()
        let changeUserDataFactory: ChangeUserDataRequestFactory =  requestFactory.makeChangeUserDataRequestFactory()

        // When
        // Call system under test
        let changedUserData  = expectation(description: "user data changed")

        changeUserDataFactory.changeUserData(id: "123", userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
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
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    // MARK: - Test LogoutRequestFactory
    
    func testLogoutRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let requestFactory = RequestFactory()
        let logoutFactory: LogoutRequestFactory = requestFactory.makeLogoutRequestFactory()
        
        // When
        // Call system under test
        let loggedOut  = expectation(description: "logged out")
        
        logoutFactory.logout(id: "123") { response in
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
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    // MARK: - Test CatalogDataRequestFactory
    
    func testCatalogDataRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let requestFactory = RequestFactory()
        let catalogDataFactory: CatalogDataRequestFactory = requestFactory.makeCatalogDataRequestFactory()
        
        // When
        // Call system under test
        let gotCatalogData  = expectation(description: "got catalog data")
        
        catalogDataFactory.catalogData(id: "1", pageNumber: "1") { response in
            switch response.result {
            case .success(let model):
                guard let elementFirst: CatalogDataResultElement = model.first else { return }
                guard let elementLast: CatalogDataResultElement = model.last else { return }
                XCTAssertEqual(elementFirst.idProduct, 123)
                XCTAssertEqual(elementFirst.productName, "Ноутбук")
                XCTAssertEqual(elementFirst.price, 45600)
                XCTAssertEqual(elementLast.idProduct, 456)
                XCTAssertEqual(elementLast.productName, "Мышка")
                XCTAssertEqual(elementLast.price, 1000)
                gotCatalogData.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    // MARK: - Test GetGoodByIdRequestFactory
    
    func testGetGoodByIdRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let requestFactory = RequestFactory()
        let getGoodByIdFactory: GetGoodByIdRequestFactory = requestFactory.makeGetGoodByIdRequestFactory()
        
        // When
        // Call system under test
        let gotGoodById = expectation(description: "got good by id")
        
        getGoodByIdFactory.getGoodById(id: "123") { response in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.productName, "Ноутбук")
                XCTAssertEqual(model.productDescription, "Мощный игровой ноутбук")
                XCTAssertEqual(model.productPrice, 45600)
                gotGoodById.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}