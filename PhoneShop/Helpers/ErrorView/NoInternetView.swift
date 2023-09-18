//
//  NoInternetView.swift
//  ListAsyncImageCache
//
//  Created by Linkon Sid on 9/9/23.
//

import SwiftUI

struct NoInternetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)

            Text("No Internet Connection")
                .font(.headline)
                
//            Button(action: {
//                dismiss()
//            }, label: {
//                Text("ok")
//            })
        }
    }
}

struct NoInternetView_Previews: PreviewProvider {
    static var previews: some View {
        NoInternetView()
    }
}
