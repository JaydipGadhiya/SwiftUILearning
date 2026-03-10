//
//  ContentView.swift
//  MVLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var storeModel: StoreModel
    private func populateProduct() async {
        do {
            try await storeModel.populateProduct()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                List(storeModel.products) { product in
                    HStack(spacing: 10) {
                        AsyncImage(url: URL(string: product.image)) { image in
                            image
                                .frame(width: 60, height: 60)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        VStack(alignment: .leading, spacing: 6.0) {
                            Text(product.title)
                                .font(.footnote)
                            Text(product.category.capitalized)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                    .listStyle(.plain)
                }.task {
                    await populateProduct()
                }
            }
        }
        .navigationTitle("ProductList")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    var configration = Configuration()
    ContentView()
        .environmentObject(
            StoreModel(
                webservice: Webservice(
                    baseURL: configration.environment.baseURL
                )
            )
        )
}
