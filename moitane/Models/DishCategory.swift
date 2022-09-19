//
//  DishCategory.swift
//  uzma
//
//  Created by misho zirakashvili on 10.09.22.
//

import Foundation

struct DishCategory: Decodable {
    let id, name, image :String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case image
    }
}
