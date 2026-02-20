//
//  HikeDetail.swift
//  SwiftUIListView
//
//  Created by Jaydip Gadhiya on 20/02/26.
//

import Foundation

struct HikeDetail: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
}
