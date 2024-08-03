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
        if let imageURL = url {
            NetworkImage(url: imageURL) { phase in
                switch phase {
                case .success(let image):
                    image.roundedThumbnail(width: width, height: height, radius: radius)
                case .empty:
                    ProgressView()
                        .frame(width: width, height: height)
                case .failure(_):
                    Image("placeholder").roundedThumbnail(width: width, height: height)
                @unknown default:
                    Image("placeholder").roundedThumbnail(width: width, height: height)
                }
            }
        } else {
            Image("placeholder").roundedThumbnail(width: width, height: height)
        }
    }
}

struct AsyncIconView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncIconView(url: URL(string: "https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"))
//        AsyncIconView(url: nil)
    }
}

