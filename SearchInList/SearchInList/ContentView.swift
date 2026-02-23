//
//  ContentView.swift
//  SearchInList
//
//  Created by Jaydip Gadhiya on 23/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var friendList: [String] = ["John", "Mary", "Monica", "Steve", "Rommy", "Jemmy"]
    @State private var filteredFriendList: [String] = []
    @State private var searchText = ""
    var body: some View {
        VStack {
            List(filteredFriendList, id: \.self) { friend in
                Text(friend)
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText) {
                if searchText.isEmpty {
                    filteredFriendList = friendList
                } else {
                    filteredFriendList = friendList.filter({$0.contains( searchText )})
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Friends")
        .onAppear() {
            filteredFriendList = friendList
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
