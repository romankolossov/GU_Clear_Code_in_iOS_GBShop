//
//  GetReviewByIdResult.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation

// MARK: - ReviewListResultElement

struct ReviewListResultElement: Codable {
    let idUser: Int
    let idComment: Int
    let commentText: String
}

typealias ReviewListResult = [ReviewListResultElement]
