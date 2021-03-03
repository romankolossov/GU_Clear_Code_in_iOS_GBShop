//
//  AddToBasketRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 03.03.2021.
//

import Foundation
import Alamofire

protocol AddToBasketRequestFactory {
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void)
}
