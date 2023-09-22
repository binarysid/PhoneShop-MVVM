//
//  PreviewLoader.swift
//  PhoneShop
//
//  Created by Linkon Sid on 2/9/23.
//

import MockDataBuilder

enum PreViewLoader {
    static let products: [Product] = MockDataBuilder.buildFrom(bundle: .main, fileName: "products.json")
}
