//
//  ProductStore.swift
//  PhoneShop
//
//  Created by Linkon on 27/8/23.
//

import Foundation
import SwiftUI

enum DataLoadingState {
    case inital, loading, completed, error
}

@MainActor
final class ProductStoreModel: ObservableObject {
    @Published var data: [ProductViewData] = []
    @AppStorage("favorites") var favorites: [Product] = []
    @Published var state: DataLoadingState = .inital
    
    let service: DataService

    init(service: DataService, data: [Product]) {
        self.service = service
    }
    
    convenience init(service: DataService) {
        self.init(service: service, data: [])
    }

    func fetch() async throws {
        let products = try await service.fetchList()
        self.data = products
    }
    
    func setLoadingState(_ state: DataLoadingState) {
        self.state = state
    }
}

extension ProductStoreModel {
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

extension ProductStoreModel {
    func submitFeedback(_ data: FeedbackData) async throws {
        try await service.postFeedback(data)
    }
}
