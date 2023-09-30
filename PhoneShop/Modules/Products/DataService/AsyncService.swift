//  PhoneShop
//  Service.swift
//
//  Created by Linkon Sid on 12/4/23.
//

import Foundation
import WebService

struct AsyncService: DataService {
    private var httpClient = HTTPClient.shared

    func fetchList() async throws -> [Product] {
//        try randomError()
        guard let request = EndPoints.productList.request else {
            throw NetworkError.badURL
        }

        do {
            let (data, response) = try await httpClient.fetch(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard httpResponse.statusCode == 200 else {
                throw NetworkError.serviceNotFound
            }
            let result = try httpClient.decode(type: [Product].self, from: data)
            guard result.count > 0 else {
                throw NetworkError.noDataFound
            }
            return result
        } catch HTTPServiceError.noInternet {
            throw NetworkError.noInternet
        }
        catch {
            throw error
        }
    }
}

extension AsyncService {
    func postFeedback(_ data: FeedbackData) async throws {
       
    }
}

extension AsyncService {
    private func randomError() throws {
        if Int.random(in: 1...10) < 5 { // randomly failed the request
            throw NetworkError.serviceNotFound
        }
    }
}
