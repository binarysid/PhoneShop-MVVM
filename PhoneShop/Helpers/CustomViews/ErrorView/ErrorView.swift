//
//  ErrorView.swift
//  PhoneShop
//
//  Created by Linkon Sid on 8/9/23.
//

import SwiftUI

struct ErrorAlertModifier: ViewModifier {
    var errorWrapper: ErrorWrapper?
    @Binding var showAlert: Bool
    
    func body(content: Content) -> some View {
        content
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(errorWrapper?.title ?? ""),
                message: Text(errorWrapper?.error.localizedDescription ?? ""),
                dismissButton: .default(Text("OK")) {
                    showAlert = false
                }
            )
        }
    }
}
