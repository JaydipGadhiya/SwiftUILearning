//
//  MVLearningApp.swift
//  MVLearning
//
//  Created by Jaydip Gadhiya on 05/03/26.
//

import SwiftUI

@main
struct MVLearningApp: App {
    
    @StateObject private var storeModel: StoreModel

    init() {
        var configration = Configuration()
        let webservice = Webservice(baseURL: configration.environment.baseURL)
        _storeModel = StateObject(wrappedValue: StoreModel(webservice: webservice))

    }

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(storeModel)
        }
    }
}
