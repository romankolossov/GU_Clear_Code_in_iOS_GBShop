//
//  ReviewData.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation
import Alamofire

class ReviewList: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl: URL

    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility),
        baseUrl: URL = URL(string: "https://sheltered-castle-91706.herokuapp.com/") ?? URL(fileURLWithPath: "")
        // baseUrl: URL = URL(string: "http://127.0.0.1:8080/") ?? URL(fileURLWithPath: "")
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
        self.baseUrl = baseUrl
    }
}

// MARK: - Extensions ReviewList

extension ReviewList: ReviewListRequestFactory {
    func reviewList(idUser: Int, pageNumber: Int, completionHandler: @escaping (AFDataResponse<ReviewListResult>) -> Void) {
        let requestModel = ReviewListRequest(baseUrl: baseUrl, idUser: idUser, pageNumber: pageNumber)

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ReviewList {

    // MARK: Nested type

    struct ReviewListRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = "reviewList"

        let idUser: Int
        let pageNumber: Int

        var parameters: Parameters? {
            [
                "idUser": idUser,
                "pageNumber": pageNumber
            ]
        }
    }
}
