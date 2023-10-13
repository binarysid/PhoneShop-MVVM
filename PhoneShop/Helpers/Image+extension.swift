//
//  extension+Image.swift
//  PhoneShop
//
//  Created by Linkon Sid on 1/9/23.
//

import SwiftUI

extension Image {
    func roundedThumbnail(width: CGFloat = 80, height: CGFloat = 80, radius: CGFloat = 20) -> some View {
        resizable()
            .frame(width: width, height: height)
            .cornerRadius(radius)
    }

    func circularThumbnail(width: CGFloat = 80, height: CGFloat = 80) -> some View {
        resizable()
            .frame(width: width, height: height)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

