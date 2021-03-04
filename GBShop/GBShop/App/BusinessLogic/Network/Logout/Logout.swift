//
//  Logout.swift
//  GBShop
//
//  Created by Roman Kolosov on 18.02.2021.
//

import Foundation
import Alamofire

class Logout: AbstractRequestFactory {

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

// MARK: - Extensions Logout

extension Logout: LogoutRequestFactory {
    func logout(id: String, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = LogoutRequest(baseUrl: baseUrl, id: id)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Logout {

    // MARK: Nested type

    struct LogoutRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "logout.json"

        let id: String

        var parameters: Parameters? {
            [ "id_user": id ]
        }
    }
}
