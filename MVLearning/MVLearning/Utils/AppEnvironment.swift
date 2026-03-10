//
//  AppEnvironment.swift
//  MVLearning
//
//  Created by Jaydip Gadhiya on 09/03/26.
//

import Foundation




struct Configuration {
    lazy var environment : AppEnvironment = {
        guard let env = ProcessInfo.processInfo.environment["ENV"] else {
            return AppEnvironment.dev
        }
        
        if env == "TEST" {
            return AppEnvironment.test
        }
        
        return AppEnvironment.dev
    }()
}


enum EndPoints {
    case products
    
    var path: String {
        switch self {
        case .products:
            return "/products"
        }
    }
}

enum AppEnvironment: String {
    case dev
    case test
    
    var baseURL: URL {
        switch self {
        case .dev:
            return URL(string: "https://fakestoreapi.com")!
        case .test:
            return URL(string: "https://fakestoreapi.com")!
        }
        
    }
}
