//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 18.02.2021.
//

import Foundation
import Alamofire

protocol LogoutRequestFactory {
    func logout(id: String, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
