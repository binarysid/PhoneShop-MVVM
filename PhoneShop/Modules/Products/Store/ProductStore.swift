//
//  ProductStore.swift
//  PhoneShop
//
//  Created by Linkon on 27/8/23.
//

import Foundation
import SwiftUI

final class ProductStore: ObservableObject {
    @Published var data: [Product] = []
    @Published var showLoader = false
    @AppStorage("favorites") var favorites: [Product] = []
    
    let service: DataService

    init(service: DataService, data: [Product]) {
        self.service = service
    }
    
    convenience init(service: DataService) {
        self.init(service: service, data: [])
    }

    func fetch() async throws {
        let products = try await service.fetchList()
        await MainActor.run {
            self.data = products
        }
    }
    
    func progressLoader() async {
        await MainActor.run {
            showLoader.toggle()
        }
    }
}

extension ProductStore {
    func isFavorite(_ product: Product) -> Bool {
        favorites.contains(product)
    }
    
    func onAdd(_ isFavorite: Bool, product: Product) {
        if isFavorite {
            favorites.removeAll(where: { $0 == product })
        } else {
            favorites.append(product)
        }
    }
}

extension ProductStore {
    func submitFeedback(_ data: FeedbackData) async throws {
        try await service.postFeedback(data)
    }
}
