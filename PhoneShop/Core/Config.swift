//
//  Config.swift
//  PhoneShop
//
//  Created by Linkon Sid on 12/8/23.
//

import Foundation

enum Config {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func stringValue(forKey key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String
        else {
          fatalError("Invalid value or undefined key")
        }
        return value
      }
}
