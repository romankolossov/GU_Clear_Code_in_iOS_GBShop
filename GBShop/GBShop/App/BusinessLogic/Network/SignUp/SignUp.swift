//
//  SignUp.swift
//  GBShop
//
//  Created by Roman Kolosov on 18.02.2021.
//

import Foundation
import Alamofire

class SignUp: AbstractRequestFactory {

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
        baseUrl: URL = AppDelegate.baseUrlGitGB
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions SignUP

extension SignUp: SignUpRequestFactory {

    func signUp(
        id: String, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<SignUpResult>) -> Void
    ) {
        let requestModel = SignUpRequest(baseUrl: baseUrl,
                                         id: id,
                                         userName: userName,
                                         password: password,
                                         email: email,
                                         gender: gender,
                                         creditCard: creditCard,
                                         bio: bio )
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension SignUp {

    // MARK: Nested type

    struct SignUpRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "registerUser.json"

        let id: String
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String

        var parameters: Parameters? {
            [
                "id_user": id,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "creditCard": creditCard,
                "bio": bio
            ]
        }
    }
}
