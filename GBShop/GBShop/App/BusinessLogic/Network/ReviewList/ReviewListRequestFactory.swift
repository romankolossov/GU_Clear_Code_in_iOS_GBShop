//
//  ReviewDataRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation
import Alamofire

protocol ReviewListRequestFactory {
    func reviewList(idUser: Int, pageNumber: Int, completionHandler: @escaping (AFDataResponse<ReviewListResult>) -> Void)
}
