//
//  ContentView.swift
//  SwiftUIComponents
//
//  Created by Jaydip Gadhiya on 18/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ComponentViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sections) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.items, id: \.self) { item in
                            NavigationLink {
                                if section.title == "Basic Views" {
                                    BasicView(title: item)
                                }
                            } label: {
                                Text(item)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI Components")
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}
#Preview {
    ContentView()
}
