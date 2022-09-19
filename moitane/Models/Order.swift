//
//  File.swift
//  uzma
//
//  Created by misho zirakashvili on 14.09.22.
//

import Foundation

struct Order: Decodable {
    let id: String?
    let name: String?
    let dish: Dish?
}
