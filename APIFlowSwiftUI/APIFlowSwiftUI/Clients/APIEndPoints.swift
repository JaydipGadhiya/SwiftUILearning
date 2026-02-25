//
//  APIEndPoints.swift
//  APIFlowSwiftUI
//
//  Created by Jaydip Gadhiya on 25/02/26.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

enum APIEndPoints {
    static let baseURL = "https://fake-json-api.mock.beeceptor.com"
    case getCompanies
    case getCompanyDetails(Int)
    
    private var path: String {
        switch self {
        case .getCompanies:
            return "/companies"
        case .getCompanyDetails(let companyId):
            return "/companies/\(companyId)"
        }
    }
    
    static func endPointURL(for endPoint: APIEndPoints) -> URL {
        let endPointPath = endPoint.path
        return URL(string: baseURL + endPointPath)!
    }
}
