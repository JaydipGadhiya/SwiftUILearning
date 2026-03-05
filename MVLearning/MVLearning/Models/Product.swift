//
//  Product.swift
//  MVLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
    let image: String
    let category: String
}
