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
            titleLabel
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

    private var titleLabel: some View {
        Label(title: {
            VStack(alignment: .listRowSeparatorLeading) {
                Text(product.title)
                Text(product.description)
                    .font(.subheadline)
            }
        }, icon: {
            icon
        })
        .labelStyle(.defaultRow)
    }

    private var icon: some View {
        AsyncIconView(url: URL(string: product.thumbnail))
        .thumbnail()
    }
}

#Preview {
    ProductRow(product: PreViewLoader.products[0])
}

