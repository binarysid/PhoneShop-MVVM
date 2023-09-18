//
//  ListAsyncImageCacheApp.swift
//  ListAsyncImageCache
//
//  Created by Linkon on 27/8/23.
//

import SwiftUI

@main
struct ListAsyncImageCacheApp: App {
    @State private var errorWrapper: ErrorWrapper?
    @State private var showAlert = false
    @State private var showConncetionError = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ProductStore(service: AsyncService()))
                .environment(\.showError) { error, title in
                    errorWrapper = ErrorWrapper(error: error, title: title)
                    showAlert = true
                }
                .environment(\.conncetionError) {
                    showConncetionError = true
                }
                .errorAlert(errorWrapper, $showAlert)
                .sheet(isPresented: $showConncetionError) {
                    NoInternetView()
                }
        }
    }
}
