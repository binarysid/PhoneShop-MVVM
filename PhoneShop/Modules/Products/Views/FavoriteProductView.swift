//
//  FavoriteProductView.swift
//  PhoneShop
//
//  Created by Linkon on 11/9/23.
//

import SwiftUI

struct FavoriteProductView: View {
    @State private var isFavorite: Bool = false
    @EnvironmentObject private var store: ProductStoreModel
    var product: Product
    
    var body: some View {
        Button(action: {
            onAddFavorite()
        }, label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
            .font(.system(size: 35))
            .foregroundColor(isFavorite ? .red : .gray)
        })
        .onAppear {
                isFavorite = store.isFavorite(product)
        }
    }
}

extension FavoriteProductView {
    private func onAddFavorite() {
        store.onAdd(isFavorite, product: product)
        isFavorite.toggle()
    }
}

struct FavoriteProductView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteProductView(product: PreViewLoader.products[0])
    }
}
