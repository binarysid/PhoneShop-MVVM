//
//  EndPoints.swift
//  PhoneShop
//
//  Created by Linkon Sid on 9/9/23.
//

import Foundation
import URLRequestBuilder

/// All the url and requests are formed here based on the environment
enum EndPoints {
    static let baseURL =  "https://" + Config.stringValue(forKey: "BASE_URL")
    static let requestBuilder = URLRequestBuilder()

    case productList

    var request: URLRequest? {
        switch self {
        case .productList:
            let url = EndPoints.baseURL + "/phone.json"
            return EndPoints.requestBuilder.createRequestWith(baseURL: url)
        }
    }
}
