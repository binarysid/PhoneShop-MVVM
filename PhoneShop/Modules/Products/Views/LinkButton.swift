//
//  SubscribeButton.swift
//  PhoneShop
//
//  Created by Linkon Sid on 9/28/23.
//

import SwiftUI

struct LinkButton: View {
    let title: String
    let url: String
    let image: String
    
    var body: some View {
        Link(destination: .init(string: url)!) {
            Label(title, image: image)
                .labelStyle(.defaultCapsule)
        }
    }
}

#Preview {
    LinkButton(title: "Visit Link", url: "https://www.youtube.com", image: "phones")
}
