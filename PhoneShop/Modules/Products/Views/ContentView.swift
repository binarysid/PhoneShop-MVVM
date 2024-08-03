//
//  ContentView.swift
//  PhoneShop
//
//  Created by Linkon on 27/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedProduct: Product?

    var body: some View {
        NavigationView {
            VStack {
                list
            }
        }
    }
}

extension ContentView {
    private var list: some View {
        ProductListView()
    }
}

// Container needed to show preview for environment binding state
struct ContentView_Previews_Container: View {
    @State private var errorWrapper: ErrorWrapper?
    @State private var showAlert = false

    var body: some View {
        ContentView()
            .environmentObject(ProductStoreModel(service: MockDataService()))
            .environment(\.showError) { error, title in
                errorWrapper = ErrorWrapper(error: error, title: title)
                showAlert = true
            }
            .errorAlert(errorWrapper, $showAlert)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView_Previews_Container()
    }
}
