//
//  GetGoodByIdRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 21.02.2021.
//

import Foundation
import Alamofire

protocol GetGoodByIdRequestFactory {
    func getGoodById(id: String, completionHandler: @escaping (AFDataResponse<GetGoodByIdResult>) -> Void)
}
