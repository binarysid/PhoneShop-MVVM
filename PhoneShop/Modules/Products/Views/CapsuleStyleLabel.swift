//
//  RowLabelStyle.swift
//  PhoneShop
//
//  Created by Linkon Sid on 10/5/23.
//

import SwiftUI

struct CapsuleStyleLabel: LabelStyle {
    var foregroundColor = Color.white
    var backgroundColor = Color.red
    var imageFrame = CGSize(width: 20, height: 20)
    var fontSize = 15.0
    var fontWeight = Font.Weight.bold
    
    func makeBody(configuration: Configuration) -> some View {
        Label {
            configuration.title
                .foregroundStyle(foregroundColor)
                .font(.system(size: fontSize, weight: fontWeight))
        } icon: {
            configuration
                .icon
                .scaledToFit()
        }
        .padding()
        .background(backgroundColor)
        .clipShape(Capsule())
    }
}

extension LabelStyle where Self == CapsuleStyleLabel {
    static var defaultCapsule: CapsuleStyleLabel { .init(foregroundColor: .black, backgroundColor: .mint, imageFrame: .init(width: 20, height: 20)) }
    static var redCapsule: CapsuleStyleLabel { .init(foregroundColor: .white, backgroundColor: .red, imageFrame: .init(width: 20, height: 20)) }
    static var greenCapsule: CapsuleStyleLabel { .init(foregroundColor: .white, backgroundColor: .green, imageFrame: .init(width: 20, height: 20)) }
}
