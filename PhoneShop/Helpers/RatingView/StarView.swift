//
//  StarView.swift
//  ListAsyncImageCache
//
//  Created by Linkon Sid on 12/9/23.
//

import SwiftUI

struct StarView: View {
    let totalRating: Int
    var foreGroundColor: Color = .gray
    var font: Font = .largeTitle
    var systemImage: String = "star.fill"
    var onChange: ((_ index: Int) -> ())?

    var body: some View {
        starView
    }
}

extension StarView {
    private var starView: some View {
        HStack {
            ForEach(1...totalRating, id: \.self) { index in
                starImage
                    .allowsHitTesting(onChange != nil)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            onChange?(index)
                        }
                    }
            }
        }
    }
    
    private var starImage: some View {
        Image(systemName: systemImage)
            .font(font)
            .foregroundColor(foreGroundColor)
    }
}

struct StarView_Previews: PreviewProvider {
    @State static var rating = 0
    static var previews: some View {
        StarView(totalRating: 5, foreGroundColor: .red, font: .largeTitle)
    }
}
