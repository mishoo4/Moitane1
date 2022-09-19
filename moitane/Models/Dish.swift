//
//  Dish.swift
//  uzma
//
//  Created by misho zirakashvili on 11.09.22.
//

import Foundation
import SwiftUI

struct Dish: Decodable  {
    let id: String?
    let name: String?
    let description: String?
    let image: String?
    let calories: Int?
    
    var formatedCalories: String {
        return "\(calories ?? 0) calories"
    }
}
