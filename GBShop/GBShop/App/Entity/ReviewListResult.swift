//
//  GetReviewByIdResult.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation

struct ReviewListResultElement: Codable {
    let idUser: Int
    let reviewText: String
}

typealias ReviewListResult = [ReviewListResultElement]
