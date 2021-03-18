//
//  CatalogDataResult.swift
//  GBShop
//
//  Created by Roman Kolosov on 21.02.2021.
//

import Foundation

// MARK: - View model

struct GoodData {
    let idProduct: Int
    let productName: String
    let price: Int

    init(resultElement: CatalogDataResultElement) {
        self.idProduct = resultElement.idProduct
        self.productName = resultElement.productName
        self.price = resultElement.price
    }
}

// MARK: - Catalog Data Result Element

struct CatalogDataResultElement: Codable {
    let idProduct: Int
    let productName: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_product"
        case productName = "product_name"
        case price
    }
}

typealias CatalogDataResult = [CatalogDataResultElement]
