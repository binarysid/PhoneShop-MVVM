//
//  Numeric+extension.swift
//  ListAsyncImageCache
//
//  Created by Linkon Sid on 11/9/23.
//

import Foundation

extension Double {
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded()
    }
    func roundStringUptoDecimal(_ place: Int) -> String {
        return String(format: "%.\(place)f", self)
    }
}
