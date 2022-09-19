//
//  AllDishes.swift
//  uzma
//
//  Created by misho zirakashvili on 15.09.22.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
    
}
