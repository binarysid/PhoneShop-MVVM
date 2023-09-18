//
//  RatingView.swift
//  ListAsyncImageCache
//
//  Created by Linkon Sid on 12/9/23.
//

import SwiftUI

struct RatingView: View {
    let totalRating: Int
    @Binding var rating: Int
    @State private var currentRating:Int = 0
    var fillColor: Color = .yellow
    var nonFillColor: Color = .gray
    var font: Font = .largeTitle
    var systemImage: String = "star.fill"

    var body: some View {
        ZStack {
            starView
                .overlay { overlayView.mask(starView) }
        }
    }
}

extension RatingView {
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(fillColor)
                    .frame(width: CGFloat(currentRating)/CGFloat(totalRating) * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starView: some View {
        StarView(totalRating: totalRating, foreGroundColor: nonFillColor, font: .largeTitle, systemImage: systemImage) { index in
            rating = index
            currentRating = index
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    @State static var rating = 0

    static var previews: some View {
        RatingView(totalRating: 5, rating: $rating)
    }
}
