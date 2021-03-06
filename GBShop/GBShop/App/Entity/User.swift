//
//  User.swift
//  GBShop
//
//  Created by Roman Kolosov on 17.02.2021.
//

import Foundation

// MARK: - Codable and View model

struct User: Codable {
    let id: Int
    let login: String
    let name: String
    let lastname: String

    enum CodingKeys: String, CodingKey {
        case id = "id_user"
        case login = "user_login"
        case name = "user_name"
        case lastname = "user_lastname"
    }
}
