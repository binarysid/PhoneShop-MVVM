//
//  ErrorWrapper.swift
//  PhoneShop
//
//  Created by Linkon Sid on 8/9/23.
//

import SwiftUI

struct ErrorWrapper: Identifiable {
    let id: UUID = UUID()
    let error: Error
    let title: String?
}

struct ErrorViewEnvironmentKey: EnvironmentKey {
    static var defaultValue: (Error, String) -> Void = {_,_ in}
}

extension EnvironmentValues {
    var showError: (Error, String) -> Void {
        get { self[ErrorViewEnvironmentKey.self] }
        set { self[ErrorViewEnvironmentKey.self] = newValue }
    }
}
