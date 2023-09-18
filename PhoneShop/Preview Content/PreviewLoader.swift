//
//  PreviewLoader.swift
//  ListAsyncImageCache
//
//  Created by Linkon Sid on 2/9/23.
//

import MockDataBuilder

enum PreViewLoader {
    enum Products {
        static func getList() -> [Product] {
            guard let items = MockDataBuilder.buildFrom(bundle: .main, resource: "products", extensions: "json", type: [Product].self) else { return [] }
            return items
        }
        
        static func getSingleItem() -> Product? {
            guard let items = MockDataBuilder.buildFrom(bundle: .main, resource: "products", extensions: "json", type: [Product].self), let item = items.first else { return nil }
            return item
        }
    }
}
