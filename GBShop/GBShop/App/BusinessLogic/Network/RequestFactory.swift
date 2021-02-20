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
        return ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    // MARK: - makeAuthRequestFatory
    
    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    // MARK: - makeSignUpRequestFactory
    
    func makeSignUpRequestFactory() -> SignUpRequestFactory {
        let errorParser = makeErrorParser()
        return SignUp(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    // MARK: - makeChangeUserDataRequestFactory
    
    func makeChangeUserDataRequestFactory() -> ChangeUserDataRequestFactory {
        let errorParser = makeErrorParser()
        return ChangeUserData(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    // MARK: - makeLogoutRequestFactory
    
    func makeLogoutRequestFactory() -> LogoutRequestFactory {
        let errorParser = makeErrorParser()
        return Logout(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
