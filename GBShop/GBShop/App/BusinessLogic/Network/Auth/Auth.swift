//
//  Auth.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.02.2021.
//

import Foundation
import Alamofire

class Auth: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL!
    //let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions Auth

extension Auth: AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void) {
        let requestModel = Login(baseUrl: baseUrl,
                                 login: userName, password: password)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Auth {
    
    // MARK: Nested type
    
    struct Login: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "login.json"
        
        let login: String
        let password: String
        
        var parameters: Parameters? {
            return [
                "username": login,
                "password": password
            ]
        }
    }
}
