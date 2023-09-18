//
//  Service.swift
//
//  Created by Linkon Sid on 12/4/23.
//

import Foundation
import WebService
import URLRequestBuilder

struct AsyncService: DataService, WebService {
    private var networkMonitor = NetworkMonitor()

    func fetchList() async throws -> [Product] {
        guard networkMonitor.isConnected else {
            throw NetworkError.noInternet
        }
//        try randomError()
        guard let request = EndPoints.productList.request else {
            throw NetworkError.badURL
        }

        do {
            let (data, response) = try await fetch(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            guard httpResponse.statusCode == 200 else {
                throw NetworkError.serviceNotFound
            }
            let result = try decode(type: [Product].self, from: data)
            guard result.count > 0 else {
                throw NetworkError.noDataFound
            }
            return result
        } catch {
            throw NetworkError.invalidJson
        }
    }
}

extension AsyncService {
    private func randomError() throws {
        if Int.random(in: 1...10) < 5 { // randomly failed the request
            throw NetworkError.serviceNotFound
        }
    }
}
