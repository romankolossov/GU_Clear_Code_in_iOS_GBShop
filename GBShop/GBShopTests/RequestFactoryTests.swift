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
    var requestFactory: RequestFactory?

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        requestFactory = nil
    }

    // MARK: - Test AuthRequestFactory

    func testAuthRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        // let requestFactory = RequestFactory()
        let authFactory: AuthRequestFactory = try XCTUnwrap(requestFactory).makeAuthRequestFatory()

        // When
        // Call system under test
        let signedIn = expectation(description: "logged in")

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
        let signUpFactory: SignUpRequestFactory = try XCTUnwrap(requestFactory).makeSignUpRequestFactory()

        // When
        // Call system under test
        let signedUp = expectation(description: "signed up")

        signUpFactory.signUp(
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
        let changeUserDataFactory: ChangeUserDataRequestFactory = try XCTUnwrap(requestFactory).makeChangeUserDataRequestFactory()

        // When
        // Call system under test
        let changedUserData = expectation(description: "user data changed")

        changeUserDataFactory.changeUserData(
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
        waitForExpectations(timeout: 3.0, handler: nil)
    }

    // MARK: - Test LogoutRequestFactory

    func testLogoutRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let logoutFactory: LogoutRequestFactory = try XCTUnwrap(requestFactory).makeLogoutRequestFactory()

        // When
        // Call system under test
        let loggedOut = expectation(description: "logged out")

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
        let catalogDataFactory: CatalogDataRequestFactory = try XCTUnwrap(requestFactory).makeCatalogDataRequestFactory()

        // When
        // Call system under test
        let gotCatalogData = expectation(description: "got catalog data")

        catalogDataFactory.catalogData(id: "1", pageNumber: "1") { response in
            // Then
            // Verify that output is as expected
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
        let getGoodByIdFactory: GetGoodByIdRequestFactory = try XCTUnwrap(requestFactory).makeGetGoodByIdRequestFactory()

        // When
        // Call system under test
        let gotGoodById = expectation(description: "got good by id")

        getGoodByIdFactory.getGoodById(id: "123") { response in
            // Then
            // Verify that output is as expected
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

    // MARK: - Test AddReviewRequestFactory

    func testAddReviewRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let addReviewRequestFactory: AddReviewRequestFactory = try XCTUnwrap(requestFactory).makeAddReviewRequestFactory()

        // When
        // Call system under test
        let addedReview = expectation(description: "review added")

        addReviewRequestFactory.addReview(idUser: 123, reviewText: "Текст отзыва") { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                addedReview.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }

    // MARK: - Test RemoveReviewRequestFactory

    func testRemoveReviewRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let removeReviewRequestFactory: RemoveReviewRequestFactory = try XCTUnwrap(requestFactory).makeRemoveReviewRequestFactory()

        // When
        // Call system under test
        let removedReview = expectation(description: "review removed")

        removeReviewRequestFactory.removeReview(idComment: 123) { response in
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
        waitForExpectations(timeout: 3.0, handler: nil)
    }

    // MARK: - Test ReviewListdRequestFactory

    func testReviewListRequestFactory() throws {
        // Given
        // Initialize test date and system under test
        let reviewListRequestFactory: ReviewListRequestFactory = try XCTUnwrap(requestFactory).makeReviewListRequestFactory()

        // When
        // Call system under test
        let gotReviewList = expectation(description: "got review list")

        reviewListRequestFactory.reviewList(idComment: 1, pageNumber: 1) { response in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                guard let elementFirst: ReviewListResultElement = model.first else { return }
                guard let elementLast: ReviewListResultElement = model.last else { return }
                XCTAssertEqual(elementFirst.idComment, 1)
                XCTAssertEqual(elementLast.idComment, 2)
                gotReviewList.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
