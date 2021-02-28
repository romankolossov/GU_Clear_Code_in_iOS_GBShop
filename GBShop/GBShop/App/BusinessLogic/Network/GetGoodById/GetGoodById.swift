//
//  GetGoodById.swift
//  GBShop
//
//  Created by Roman Kolosov on 21.02.2021.
//

import Foundation
import Alamofire

class GetGoodById: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/") ?? URL(fileURLWithPath: "")
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions GetGoodById

extension GetGoodById: GetGoodByIdRequestFactory {
    func getGoodById(id: String, completionHandler: @escaping (AFDataResponse<GetGoodByIdResult>) -> Void) {
        let requestModel = GetGoodByIdRequest(baseUrl: baseUrl, id: id)

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension GetGoodById {

    // MARK: Nested type

    struct GetGoodByIdRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "getGoodById.json"

        let id: String

        var parameters: Parameters? {
            [ "id_product": id ]
        }
    }
}
