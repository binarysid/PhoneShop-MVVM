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
        HStack {
            titleDesc
            Spacer()
            price
        }
        .padding()
    }
}

extension ProductRow {
    private var price: some View {
        Text("$\(product.price.roundStringUptoDecimal(0))")
    }

    private var titleDesc: some View {
        Label(title: {
            VStack(alignment: .listRowSeparatorLeading) {
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

#Preview {
    ProductRow(product: PreViewLoader.products[0])
}

