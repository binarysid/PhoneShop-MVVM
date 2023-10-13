//
//  ProductListView.swift
//  PhoneShop
//
//  Created by Linkon Sid on 1/9/23.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject private var store: ProductStoreModel
    @Environment(\.showError) private var showError
    @Environment(\.conncetionError) private var connectionError
    private let column: [GridItem] = Array(repeating: .init(.flexible()), count: 1)
    
    var body: some View {
        NavigationStack {
            list
            .overlay {
                if store.state == .loading {
                    ProgressView()
                }
            }
            .task {
                if store.state == .inital {
                    await fetchData()
                }
            }
            .refreshable {
                if store.state != .loading {
                    Task {
                        await fetchData()
                    }
                }
            }
        }
    }
}

extension ProductListView {
    private var list: some View {
        ScrollView {
            LazyVGrid(columns: column,
                      alignment: .leading,
                      spacing: 10,
                      pinnedViews: .sectionHeaders
            ) {
                ForEach(store.data, id: \.self) { item in
                    Section {
                        ProductHGrid(products: item.products)
                    } header: {
                        categoryHeader(title: item.category)
                    }
                }
            }
        }
    }
    
    private func productView(data: Product) -> some View {
        NavigationLink(destination: {
            ProductDetailView(product: data)
        }, label: {
            ProductRow(product: data)
                .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                .padding(10)
        })
        .buttonStyle(PlainButtonStyle())
    }
    
    private func categoryHeader(title: String) -> some View {
        Text(title)
            .padding()
//            .frame(minWidth: 70)
//            .rotationEffect(Angle(degrees: -90))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(RoundedRectangle(cornerRadius: 0)
                .fill(Color.mint))
    }
}

extension ProductListView {
    private func fetchData() async {
        store.setLoadingState(.loading)
        do {
            try await store.fetch()
        } catch let error as NetworkError where error == .noInternet {
            connectionError()
        } catch {
            showError(error, "Error")
        }
        store.setLoadingState(.completed)
    }
}

// Container needed to show preview for environment binding state
struct ListView_Previews_Container: View {
    @State private var errorWrapper: ErrorWrapper?
    @State private var showAlert = false

    var body: some View {
        ProductListView()
            .environmentObject(ProductStoreModel(service: AsyncService(), data: PreViewLoader.products))
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
