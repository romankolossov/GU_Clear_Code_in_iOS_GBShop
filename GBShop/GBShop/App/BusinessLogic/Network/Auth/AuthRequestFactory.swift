//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.02.2021.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
