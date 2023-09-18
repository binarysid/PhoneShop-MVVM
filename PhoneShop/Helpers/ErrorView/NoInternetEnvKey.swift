//
//  NoInternetEnvKey.swift
//  ListAsyncImageCache
//
//  Created by Linkon Sid on 9/9/23.
//

import SwiftUI

struct ConncetionErrorViewEnvironmentKey: EnvironmentKey {
    static var defaultValue: () -> Void = {}
}

extension EnvironmentValues {
    var conncetionError: () -> Void {
        get { self[ConncetionErrorViewEnvironmentKey.self] }
        set { self[ConncetionErrorViewEnvironmentKey.self] = newValue }
    }
}
