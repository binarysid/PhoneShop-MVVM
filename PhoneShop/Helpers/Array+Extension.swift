//
//  Array+Extension.swift
//  PhoneShop
//
//  Created by Linkon on 11/9/23.
//

import Foundation

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

extension Array where Self == [Product] {
    func toViewData() -> [ProductViewData] {
        var categories: [String: ProductViewData] = [:]

        self.forEach {
            if let _ = categories[$0.category] {
                categories[$0.category]?.addProduct(product: $0)
            } else {
                categories[$0.category] = ProductViewData(category: $0.category, product: $0)
            }
        }

        return categories.map { $0.value }
    }
}
