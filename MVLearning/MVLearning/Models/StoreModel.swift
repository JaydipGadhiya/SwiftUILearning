//
//  StoreModel.swift
//  MVLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import Foundation
import Combine




@MainActor
class StoreModel: ObservableObject {

    let webservice: Webservice
    @Published var products: [Product] = []
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProduct() async throws {
        products = try await webservice.getProduct()
    }
}
