//
//  ApiResponce.swift
//  uzma
//
//  Created by misho zirakashvili on 14.09.22.
//

import Foundation

struct ApiResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
