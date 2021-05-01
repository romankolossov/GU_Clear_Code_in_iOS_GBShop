//
//  AppCoordinator.swift
//  GBShop
//
//  Created by Roman Kolosov on 15.03.2021.
//

import Foundation

// for keeping loggedin user info

class UserData {

    // MARK: - Public properties)

    let user: User

    // MARK: - Initializers

    init(id: Int, login: String, name: String, lastName: String) {
        user = User(id: id, login: login, name: name, lastname: lastName)
    }

    // MARK: - Public methods

    static func saveUser(id: Int, login: String, name: String, lastName: String) {
        let defaults = UserDefaults.standard

        defaults.set(id, forKey: "id")
        defaults.set(login, forKey: "login")
        defaults.set(name, forKey: "name")
        defaults.set(lastName, forKey: "lastName")
    }

    static func getUser() -> UserData {
        let defaults = UserDefaults.standard

        let userData = UserData(
            id: defaults.integer(forKey: "id"),
            login: defaults.string(forKey: "login") ?? "",
            name: defaults.string(forKey: "name") ?? "",
            lastName: defaults.string(forKey: "lastName") ?? ""
        )
        return userData
    }

    static func clearUser() {
        let defaults = UserDefaults.standard

        defaults.set(nil, forKey: "id")
        defaults.set(nil, forKey: "login")
        defaults.set(nil, forKey: "name")
        defaults.set(nil, forKey: "lastName")
    }

}
