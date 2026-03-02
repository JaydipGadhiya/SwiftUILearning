//
//  ProductListViewModel.swift
//  MVVMLearning
//
//  Created by Jaydip Gadhiya on 02/03/26.
//

import Foundation
internal import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    
    let webservice: Webservice
    @Published var products: [ProductViewModel] = []
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async {
        do {
            let products = try await webservice.getProducts()
            self.products = products.map({ProductViewModel.init(product: $0)})
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ProductViewModel: Identifiable {
    
    private var product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var id: Int {
        product.id
    }
    
    var title: String {
        product.title
    }
    
    var price: Double {
        product.price
    }
    
    var image: String {
        product.image
    }
    
    var category: String {
        product.category
    }
}
