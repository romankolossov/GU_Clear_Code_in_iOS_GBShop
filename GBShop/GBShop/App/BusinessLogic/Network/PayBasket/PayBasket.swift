//
//  PayBasket.swift
//  GBShop
//
//  Created by Roman Kolosov on 03.03.2021.
//

import Foundation
import Alamofire

class PayBasket: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = URL(string: "https://sheltered-castle-91706.herokuapp.com/") ?? URL(fileURLWithPath: "")
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions PayBasket

extension PayBasket: PayBasketRequestFactory {
    func payBasket(completionHandler: @escaping (AFDataResponse<PayBasketResult>) -> Void) {
        let requestModel = PayBasketRequest(baseUrl: baseUrl)
        
        self.request(request: requestModel, completionHandler: completionHandler)
    }
    
    
}

extension PayBasket {

    // MARK: Nested type

    struct PayBasketRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "deleteFromBasket"

        var parameters: Parameters? { [:] }
    }
}



