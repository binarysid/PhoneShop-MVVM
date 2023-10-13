//
//  ProductDetailView.swift
//  PhoneShop
//
//  Created by Linkon Sid on 8/9/23.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    @EnvironmentObject private var store: ProductStoreModel
    @State var ratingPoint = 0
    let totalRating = 5

    var body: some View {
            VStack(spacing: 20) {
                icon
                rating
                feedback
                link
            }
            .toolbar {
                favorite
            }
        .navigationTitle(product.title)
        .padding()
    }
}

extension ProductDetailView {
    private var feedback: some View {
        FeedbackSubmitView(rating: $ratingPoint)
    }

    private var rating: some View {
        RatingView(totalRating: totalRating, rating: $ratingPoint)
    }
    
    private var favorite: some View {
        FavoriteProductView(product: product)
    }

    private var title: some View {
        Text(product.title)
            .font(.headline)
    }

    private var icon: some View {
        AsyncIconView(url: URL(string: product.thumbnail), width: 150, height: 150)
        .thumbnail(width: 150, height: 150)
    }
    
    private var link: some View {
        LinkButton(title: "Visit Phone Shop Online", url: "https://www.youtube.com", image: "phones")
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: PreViewLoader.products[0])
    }
}
