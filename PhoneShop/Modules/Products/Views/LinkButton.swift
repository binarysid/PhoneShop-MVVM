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

    var body: some View {
        Link(destination: .init(string: url)!) {
            Text(title)
                .bold()
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    LinkButton(title: "Visit Link", url: PreViewLoader.products[0].link)
}
