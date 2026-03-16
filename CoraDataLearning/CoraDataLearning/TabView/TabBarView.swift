//
//  TabView.swift
//  CoraDataLearning
//
//  Created by Jaydip Gadhiya on 13/03/26.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Text("Expense")
                    Image(systemName: "list.bullet.rectangle.portrait")
                }

            SettingView()
                .tabItem {
                    Text("Setting")
                    Image(systemName: "gear")
                }
        }
        .tint(Color.indigo)
    }
}

#Preview {
    TabBarView()
}
