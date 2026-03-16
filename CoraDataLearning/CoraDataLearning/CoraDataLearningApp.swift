//
//  CoraDataLearningApp.swift
//  CoraDataLearning
//
//  Created by Jaydip Gadhiya on 13/03/26.
//

import SwiftUI

@main
struct CoraDataLearningApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
                .preferredColorScheme(.dark)
        }
    }
}
