//
//  ProductHGrid.swift
//  PhoneShop
//
//  Created by Linkon Sid on 10/7/23.
//

import SwiftUI

struct ProductHGrid: View {
    let products: [Product]
    private let rows: [GridItem] = Array(repeating: .init(.fixed(150)), count: 1)

    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, alignment: .center) {
                    ForEach(products, id: \.self) { product in
                        productView(data: product)
                    }
                }
            }
            .padding(10)
        }
    }
}

extension ProductHGrid {
    private func productView(data: Product) -> some View {
        NavigationLink(destination: {
            ProductDetailView(product: data)
        }, label: {
            ProductRow(product: data)
                .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(10)
        })
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ProductHGrid(products: PreViewLoader.products)
}
