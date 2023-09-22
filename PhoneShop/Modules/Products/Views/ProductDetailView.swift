//
//  ProductDetailView.swift
//  PhoneShop
//
//  Created by Linkon Sid on 8/9/23.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @EnvironmentObject private var store: ProductStore
    @State private var isFavorite: Bool = false

    var body: some View {
        VStack {
            icon
            title
            favorite
        }
        .onAppear {
            isFavorite = store.isFavorite(product)
        }
    }
}

extension ProductDetailView {
    private var favorite: some View {
        Button(action: {
            onAddFavorite()
        }, label: {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
            .font(.system(size: 50))
            .foregroundColor(isFavorite ? .red : .gray)
        })
    }

    private var title: some View {
        Text(product.title)
            .font(.headline)
    }

    private var icon: some View {
        AsyncIconView(url: URL(string: product.thumbnail), width: 150, height: 150)
        .thumbnail(width: 150, height: 150)
    }

}

extension ProductDetailView {
    private func onAddFavorite() {
        store.onAdd(isFavorite, product: product)
        isFavorite.toggle()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: PreViewLoader.products[0])
    }
}
