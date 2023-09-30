//
//  MainApp.swift
//  PhoneShop
//
//  Created by Linkon on 27/8/23.
//

import SwiftUI

@main
struct MainApp: App {
    @State private var errorWrapper: ErrorWrapper?
    @State private var showAlert = false
    @State private var showConncetionError = false
    
    init() {
        // Register the custom URLProtocol
//        URLProtocol.registerClass(CustomURLProtocol.self)
    }

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
