//
//  LoginResult.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.02.2021.
//

import Foundation

struct LoginResult: Codable {
    let result: Int
    let user: User
    // let authToken: String
}
