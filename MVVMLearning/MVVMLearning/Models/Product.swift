//
//  Product.swift
//  MVVMLearning
//
//  Created by Jaydip Gadhiya on 02/03/26.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
    let image: String
    let category: String
}
