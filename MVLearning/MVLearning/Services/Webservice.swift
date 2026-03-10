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
    
    private var baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func getProduct() async throws -> [Product] {
        
        guard let  url = URL(string: EndPoints.products.path, relativeTo: baseURL) else {
            throw NetworkError.badURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let products =  try JSONDecoder().decode([Product].self, from: data)        
        return products
    }
}
