//
//  extension+View.swift
//  PhoneShop
//
//  Created by Linkon Sid on 1/9/23.
//

import SwiftUI

extension View {
    func thumbnail(width: CGFloat = 80, height: CGFloat = 80, radius: CGFloat = 20) -> some View {
        scaledToFit()
            .frame(width: width, height: height)
            .cornerRadius(radius)
    }
    
    func errorAlert(_ errorWrapper: ErrorWrapper?, _ showAlert: Binding<Bool>) -> some View {
        self.modifier(ErrorAlertModifier(errorWrapper: errorWrapper, showAlert: showAlert))
    }
}
