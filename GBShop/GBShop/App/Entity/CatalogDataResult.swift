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

    init(goodElement: CatalogDataResultElement) {
        self.idProduct = goodElement.idProduct
        self.productName = goodElement.productName
        self.price = goodElement.price
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
