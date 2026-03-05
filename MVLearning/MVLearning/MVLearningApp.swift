//
//  MVLearningApp.swift
//  MVLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import SwiftUI

@main
struct MVLearningApp: App {
    
    @StateObject private var storeModel = StoreModel(webservice: Webservice())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
