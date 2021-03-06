//
//  DeleteFromBasket.swift
//  GBShop
//
//  Created by Roman Kolosov on 03.03.2021.
//

import Foundation
import Alamofire

class DeleteFromBasket: AbstractRequestFactory {

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

// MARK: - Extensions DeleteFromBasket

extension DeleteFromBasket: DeleteFromBasketRequestFactory {
    func deleteFromBasket(idProduct: Int, completionHandler: @escaping (AFDataResponse<DeleteFromBasketResult>) -> Void) {
        let requestModel = DeleteFromBasketRequest(baseUrl: baseUrl, idProduct: idProduct)

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension DeleteFromBasket {

    // MARK: Nested type

    struct DeleteFromBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket.json"

        let idProduct: Int

        var parameters: Parameters? {
            [ "id_product": idProduct ]
        }
    }
}
