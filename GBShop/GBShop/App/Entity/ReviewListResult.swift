//
//  GetReviewByIdResult.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation

// MARK: - View model

struct ReviewData {
    let idUser: Int
    let idComment: Int
    let commentText: String

    init(reviewElement: ReviewListResultElement) {
        self.idUser = reviewElement.idUser
        self.idComment = reviewElement.idComment
        self.commentText = reviewElement.commentText
    }
}

// MARK: - ReviewListResultElement

struct ReviewListResultElement: Codable {
    let idUser: Int
    let idComment: Int
    let commentText: String
}

typealias ReviewListResult = [ReviewListResultElement]
