//
//  Product.swift
//  PhoneShop
//
//  Created by Linkon on 27/8/23.
//

import Foundation

struct Product: Codable, Identifiable, Hashable, Equatable {
    let id: Int
    let title: String
    let description: String
    let thumbnail: String
    let price: Double
    let rating: Float
    let brand: String
    let category: String
    let link: String
}

