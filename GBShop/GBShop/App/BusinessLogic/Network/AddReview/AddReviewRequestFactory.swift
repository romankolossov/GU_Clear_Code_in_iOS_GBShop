//
//  AddReviewRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation
import Alamofire

protocol AddReviewRequestFactory {
    func addReview(idUser: Int, reviewText: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void)
}
