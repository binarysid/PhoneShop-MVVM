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
        VStack {
            Spacer()
            icon
            Text(product.title)
                .foregroundStyle(Color(.white))
                .lineLimit(1)
                .truncationMode(.tail)
            Spacer()
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

extension ProductRow {
    private var price: some View {
        Text("$\(String(format: "%.0f", product.price ?? 0))")
    }
    
    // this view is not in use. kept for future reference
    private var titleLabel: some View {
        Label(title: {
            VStack(alignment: .listRowSeparatorLeading) {
                Text(product.title)
                Text(product.description ?? "")
                    .font(.subheadline)
            }
        }, icon: {
            icon
        })
        .labelStyle(.defaultRow)
    }

    private var icon: some View {
        let imageURL = product.thumbnail.flatMap { URL(string: $0) }
        return AsyncIconView(url: imageURL)
            .frame(alignment: .center)
    }
}

#Preview {
    ProductRow(product: PreViewLoader.products[0])
}

