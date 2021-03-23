//
//  RemoveReview.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation
import Alamofire

class RemoveReview: AbstractRequestFactory {

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

// MARK: - Extensions RemoveReview

extension RemoveReview: RemoveReviewRequestFactory {
    func removeReview(idComment: Int, completionHandler: @escaping (AFDataResponse<RemoveReviewResult>) -> Void) {
        let requestModel = RemoveReviewRequest(baseUrl: baseUrl, idComment: idComment)

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension RemoveReview {

    // MARK: Nested type

    struct RemoveReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "removeReview.json"

        let idComment: Int

        var parameters: Parameters? {
            [
                "id_comment": idComment
            ]
        }
    }
}
