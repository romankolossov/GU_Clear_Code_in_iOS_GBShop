//
//  RequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.02.2021.
//

import Foundation
import Alamofire

class RequestFactory {

    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }

    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()

    let sessionQueue = DispatchQueue.global(qos: .utility)

    // MARK: - Make AuthRequestFatory

    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make SignUpRequestFactory

    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make ChangeUserDataRequestFactory

    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make LogoutRequestFactory

    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make CatalogDataRequestFactory

    func makeCatalogDataRequestFactory() -> CatalogDataRequestFactory {
        let errorParser = makeErrorParser()
        return CatalogData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make GetGoodByIdRequestFactory

    func makeGetGoodByIdRequestFactory() -> GetGoodByIdRequestFactory {
        let errorParser = makeErrorParser()
        return GetGoodById(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make AddReviewRequestFactory

    func makeAddReviewRequestFactory() -> AddReviewRequestFactory {
        let errorParser = makeErrorParser()
        return AddReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make RemoveReviewRequestFactory

    func makeRemoveReviewRequestFactory() -> RemoveReviewRequestFactory {
        let errorParser = makeErrorParser()
        return RemoveReview(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make ReviewListRequestFactory

    func makeReviewListRequestFactory() -> ReviewListRequestFactory {
        let errorParser = makeErrorParser()
        return ReviewList(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make AddToBasketRequestFactory

    func makeAddToBasketRequestFactory() -> AddToBasketRequestFactory {
        let errorParser = makeErrorParser()
        return AddToBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make DeleteFromBasketRequestFactory

    func makeDeleteFromBasketRequestFactory() -> DeleteFromBasketRequestFactory {
        let errorParser = makeErrorParser()
        return DeleteFromBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    // MARK: - Make PayBasketRequestFactory

    func makePayBasketRequestFactory() -> PayBasketRequestFactory {
        let errorParser = makeErrorParser()
        return PayBasket(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
