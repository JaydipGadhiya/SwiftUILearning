//
//  CompanyClient.swift
//  APIFlowSwiftUI
//
//  Created by Jaydip Gadhiya on 25/02/26.
//

import Foundation



struct CompanyClient: Decodable {
    func getCompany() async throws -> [Company]? {
        let (data, response) = try await URLSession.shared.data(from: APIEndPoints.endPointURL(for: .getCompanies))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let companyData = try JSONDecoder().decode([Company].self, from: data)
        return companyData
    }
}
