//
//  AsyncIconView.swift
//  PhoneShop
//
//  Created by Linkon Sid on 11/9/23.
//

import SwiftUI
import NetworkImage

struct AsyncIconView: View {
    let url: URL?
    var width: CGFloat = 80
    var height: CGFloat = 80
    var radius: CGFloat = 20
    
    var body: some View {
        NetworkImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image.roundedThumbnail(width: width, height: height, radius: radius)
            case .empty:
                ProgressView()
            case .failure(_):
                Image(systemName: "questionmark").roundedThumbnail(width: width, height: height)
            @unknown default:
                Image(systemName: "questionmark").roundedThumbnail(width: width, height: height)
            }
        }
    }
}

struct AsyncIconView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncIconView(url: URL(string: "https://i.dummyjson.com/data/products/1/thumbnail.jpg"))
    }
}

