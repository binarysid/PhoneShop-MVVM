//
//  ProductViewData.swift
//  PhoneShop
//
//  Created by Linkon Sid on 10/6/23.
//

import Foundation

struct ProductViewData: Identifiable, Hashable {
    let id = UUID()
    let category: String
    var products: [Product] = []
    
    init(category: String, product: Product) {
        self.category = category
        self.products.append(product)
    }
    
    mutating func addProduct(product: Product) {
        self.products.append(product)
    }
}
