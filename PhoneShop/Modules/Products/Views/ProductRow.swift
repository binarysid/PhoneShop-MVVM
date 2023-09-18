//
//  ProductRow.swift
//  PhoneShop
//
//  Created by Linkon Sid on 1/9/23.
//

import SwiftUI
import NetworkImage

struct ProductRow: View {
    var product: Product

    var body: some View {
        HStack(spacing: 8) {
            titleDesc
            price
        }
    }
}

extension ProductRow {
    private var price: some View {
        Text("$\(product.price.roundStringUptoDecimal(0))")
    }

    private var titleDesc: some View {
        Label(title: {
            VStack(alignment: .leading) {
                Text(product.title)
                Text(product.description)
                    .font(.subheadline)
            }
        }, icon: {
            icon
        })
        .font(.title2)
        .labelStyle(.titleAndIcon)
    }

    private var icon: some View {
        AsyncIconView(url: URL(string: product.thumbnail))
        .thumbnail()
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        if let product = PreViewLoader.Products.getSingleItem() {
            ProductRow(product: product)
        } else {
            EmptyView()
        }
    }
}
