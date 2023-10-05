//
//  ProductListView.swift
//  PhoneShop
//
//  Created by Linkon Sid on 1/9/23.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject private var store: ProductStore
    @Environment(\.showError) private var showError
    @Environment(\.conncetionError) private var connectionError
    @Binding var selectedProduct: Product?
    
    var body: some View {
        NavigationStack {
            List(store.data, id: \.id) { product in
                NavigationLink(value: product) {
                    ProductRow(product: product)
                }
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
            .overlay {
                if store.showLoader {
                    ProgressView()
                }
            }
            .task {
                await fetchData()
            }
            .refreshable {
                await fetchData()
            }
        }
    }
}

extension ProductListView {
    private func fetchData() async {
        await store.progressLoader()
        do {
            try await store.fetch()
        } catch let error as NetworkError where error == .noInternet {
            connectionError()
        } catch {
            showError(error, "Error")
        }
        await store.progressLoader()
    }
}

// Container needed to show preview for environment binding state
struct ListView_Previews_Container: View {
    @State private var errorWrapper: ErrorWrapper?
    @State private var showAlert = false

    var body: some View {
        ProductListView(selectedProduct: Binding.constant(nil))
            .environmentObject(ProductStore(service: AsyncService(), data: PreViewLoader.products))
            .environment(\.showError) { error, title in
                errorWrapper = ErrorWrapper(error: error, title: title)
                showAlert = true
            }
            .errorAlert(errorWrapper, $showAlert)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView_Previews_Container()
    }
}
