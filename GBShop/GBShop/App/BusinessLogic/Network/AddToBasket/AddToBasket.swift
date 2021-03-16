//
//  AddToBasket.swift
//  GBShop
//
//  Created by Roman Kolosov on 03.03.2021.
//

import Foundation
import Alamofire

class AddToBasket: AbstractRequestFactory {

    // MARK: - Public properties

    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    // MARK: - Initializers

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = NetworkConfig.baseUrlGitGB
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions AddToBasket

extension AddToBasket: AddToBasketRequestFactory {
    func addToBasket(idProduct: Int, quantity: Int, completionHandler: @escaping (AFDataResponse<AddToBasketResult>) -> Void) {
        let requestModel = AddToBasketRequest(baseUrl: baseUrl, idProduct: idProduct, quantity: quantity)

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddToBasket {

    // MARK: Nested type

    struct AddToBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addToBasket.json"

        let idProduct: Int
        let quantity: Int

        var parameters: Parameters? {
            [
                "id_product": idProduct,
                "quantity": quantity
            ]
        }
    }
}
