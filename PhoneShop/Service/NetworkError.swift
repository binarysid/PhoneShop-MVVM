//
//  NetworkError.swift
//  ListAsyncImageCache
//
//  Created by Linkon Sid on 9/9/23.
//

import Foundation

enum NetworkError: Error {
    case serviceNotFound
    case badURL
    case noDataFound
    case invalidResponse
    case invalidJson
    case noInternet
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .serviceNotFound:
            return "Service Error"
        case .badURL:
            return "URL Error"
        case .noDataFound:
            return "No Data Found"
        case .invalidResponse:
            return "Invalid Response"
        case .invalidJson:
            return "Invalid Response"
        case .noInternet:
            return "No Internet Connection"
        }
    }
}
