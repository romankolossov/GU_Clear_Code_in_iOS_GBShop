//
//  AddReview.swift
//  GBShop
//
//  Created by Roman Kolosov on 28.02.2021.
//

import Foundation
import Alamofire

class AddReview: AbstractRequestFactory {

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

// MARK: - Extensions AddReview

extension AddReview: AddReviewRequestFactory {
    func addReview(idUser: Int, reviewText: String, completionHandler: @escaping (AFDataResponse<AddReviewResult>) -> Void) {
        let requestModel = AddReviewRequest(baseUrl: baseUrl, idUser: idUser, reviewText: reviewText)

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension AddReview {

    // MARK: Nested type

    struct AddReviewRequest: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "addReview.json"

        let idUser: Int
        let reviewText: String

        var parameters: Parameters? {
            [
                "id_user": idUser,
                "text": reviewText
            ]
        }
    }
}
