//
//  CatalogData.swift
//  GBShop
//
//  Created by Roman Kolosov on 21.02.2021.
//

import Foundation
import Alamofire

class CatalogData: AbstractRequestFactory {

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

// MARK: - Extensions CatalogData

extension CatalogData: CatalogDataRequestFactory {
    func catalogData(id: String, pageNumber: String, completionHandler: @escaping (AFDataResponse<CatalogDataResult>) -> Void) {
        let requestModel = CatalogDataRequest(baseUrl: baseUrl, id: id, pageNumber: pageNumber)

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension CatalogData {

    // MARK: Nested type

    struct CatalogDataRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"

        let id: String
        let pageNumber: String

        var parameters: Parameters? {
            [
                "id_category": id,
                "page_number": pageNumber
            ]
        }
    }
}
