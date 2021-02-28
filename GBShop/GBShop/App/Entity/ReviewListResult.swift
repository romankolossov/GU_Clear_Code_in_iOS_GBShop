//
//  GetReviewByIdResult.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation

struct ReviewListResultElement: Codable {
    let idComment: Int
    let idUser: Int
    let commentText: String
}

typealias ReviewListResult = [ReviewListResultElement]
