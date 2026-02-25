//
//  ContentView.swift
//  APIFlowSwiftUI
//
//  Created by Jaydip Gadhiya on 25/02/26.
//

import SwiftUI

struct ContentView: View {
    let companyClient = CompanyClient()
    @State private var companyList: [Company]?
    
    private func fetchCompany() async {
        do {
            guard let company = try await companyClient.getCompany() else { return }
            companyList = company
        } catch {
            print(error.localizedDescription)
        }
    }
    var body: some View {
        NavigationStack {
                List(companyList ?? [], id: \.self) { company in
                    HStack(spacing: 20) {
                        AsyncImage(url: URL(string: company.logo))
                            .frame(width: 60, height: 60)
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading) {
                            Text(company.name)
                                .font(.headline)
                            Text(company.industry)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Company List")
                .navigationBarTitleDisplayMode(.large)
                .task {
                    Task {
                        await fetchCompany()
                    }
                }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
