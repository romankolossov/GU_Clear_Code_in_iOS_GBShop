//
//  CatalogDataRequestFactory.swift
//  GBShop
//
//  Created by Roman Kolosov on 21.02.2021.
//

import Foundation
import Alamofire

protocol CatalogDataRequestFactory {
    func catalogData(id: String, pageNumber: String, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void)
}
