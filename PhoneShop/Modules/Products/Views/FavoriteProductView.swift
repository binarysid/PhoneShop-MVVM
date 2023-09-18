//
//  FavoriteProductView.swift
//  PhoneShop
//
//  Created by Linkon on 11/9/23.
//

import SwiftUI

struct FavoriteProductView: View {
    @AppStorage("favorites") var items: [Product] = []
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FavoriteProductView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteProductView()
    }
}
