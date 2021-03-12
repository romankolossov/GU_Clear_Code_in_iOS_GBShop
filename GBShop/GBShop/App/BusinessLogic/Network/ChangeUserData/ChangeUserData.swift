//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Roman Kolosov on 18.02.2021.
//

import Foundation
import Alamofire

class ChangeUserData: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/") ?? URL(fileURLWithPath: "")
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions ChangeUserData

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(
        id: String, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void
    ) {
        let requestModel = ChangeUserDataRequest(baseUrl: baseUrl,
                                                 id: id,
                                                 userName: userName,
                                                 password: password,
                                                 email: email,
                                                 gender: gender,
                                                 creditCard: creditCard,
                                                 bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeUserData {

    // MARK: Nested type

    struct ChangeUserDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"

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
