//
//  RowLabelStyle.swift
//  PhoneShop
//
//  Created by Linkon Sid on 10/5/23.
//

import SwiftUI

struct RowLabelStyle: LabelStyle {
    var lineLimit = 1
    var spacing = 12.0

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: spacing) {
            configuration.icon
            configuration.title
                .lineLimit(lineLimit)
        }
        .font(.title2)
        .labelStyle(.titleAndIcon)
    }
}

extension LabelStyle where Self == RowLabelStyle {
    static var defaultRow: RowLabelStyle { .init(lineLimit: 2, spacing: 12) }

}
//#Preview {
//    RowLabelStyle()
//}

