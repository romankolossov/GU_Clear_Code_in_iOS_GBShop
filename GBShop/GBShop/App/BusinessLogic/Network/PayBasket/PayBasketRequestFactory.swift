//
//  PayBasketRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 03.03.2021.
//

import Foundation
import Alamofire

protocol PayBasketRequestFactory {
    func payBasket(idPayProve: Int, completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void)
}
