//
//  UserDefaults+Extention.swift
//  uzma
//
//  Created by misho zirakashvili on 16.09.22.
//

import Foundation

extension UserDefaults {
    private enum UserDefaults: String {
        case hasOnboarded
    }
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaults.hasOnboarded.rawValue)
        } set {
            setValue(newValue, forKey: UserDefaults.hasOnboarded.rawValue)
        }
    }
}
