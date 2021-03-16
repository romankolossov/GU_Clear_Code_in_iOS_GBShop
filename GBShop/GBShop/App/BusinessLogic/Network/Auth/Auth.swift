//
//  Auth.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.02.2021.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {

    // MARK: - Public properties

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    // MARK: - Initializers

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = NetworkConfig.baseUrlGitGB
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions Auth

extension Auth: AuthRequestFactory {
    func signIn(userName: String, password: String, completionHandler: @escaping (AFDataResponse<SignInResult>) -> Void) {
        let requestModel = SignInRequest(baseUrl: baseUrl,
                                        login: userName,
                                        password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {

    // MARK: Nested type

    struct SignInRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"

        let login: String
        let password: String

        var parameters: Parameters? {
            [
                "username": login,
                "password": password
            ]
        }
    }
}
