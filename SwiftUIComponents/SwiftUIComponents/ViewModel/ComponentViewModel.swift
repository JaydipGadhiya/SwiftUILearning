//
//  ComponetViewModel.swift
//  SwiftUIComponents
//
//  Created by Jaydip Gadhiya on 18/03/26.
//

import Foundation
import Combine
class ComponentViewModel: ObservableObject {
    @Published var sections: [ComponentSection] = []
    
    func loadData() {
        sections = SwiftUIComponetModel.getAll()
    }
}
