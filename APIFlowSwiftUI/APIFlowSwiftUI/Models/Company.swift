//
//  Company.swift
//  APIFlowSwiftUI
//
//  Created by Jaydip Gadhiya on 25/02/26.
//

import Foundation

struct Company: Decodable, Hashable {
    let name: String
    let address: String
    let country: String
    let industry: String
    let logo: String
}
