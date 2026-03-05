//
//  Webservice.swift
//  MVLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badResponse
    case badData
}

class Webservice {
    
    func getProduct() async throws -> [Product] {
        
        guard let  url = URL(string: "https://fakestoreapi.com/products") else { throw NetworkError.badURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let products =  try JSONDecoder().decode([Product].self, from: data)        
        return products
    }
}
