//
//  String+Extention.swift
//  uzma
//
//  Created by misho zirakashvili on 10.09.22.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
