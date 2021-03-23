//
//  NetworkConfig.swift
//  GBShop
//
//  Created by Roman Kolosov on 16.03.2021.
//

import Foundation

// Define base URL

enum NetworkConfig {
    static let baseUrlGitGB = URL(
        string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/") ?? URL(fileURLWithPath: ""
        )
    static let baseUrlHeroku = URL(
        string: "https://sheltered-castle-91706.herokuapp.com/") ?? URL(fileURLWithPath: ""
        )
    static let baseUrlLocal = URL(
        string: "http://127.0.0.1:8080/") ?? URL(fileURLWithPath: ""
        )
}
