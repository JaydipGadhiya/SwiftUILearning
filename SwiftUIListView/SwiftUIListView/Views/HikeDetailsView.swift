//
//  HikeDetailsView.swift
//  HelloSwiftUI
//
//  Created by Jaydip Gadhiya on 18/02/26.
//

import SwiftUI

struct HikeDetailsView: View {
    let hike: HikeDetail
    @State private var isZoomed = false
    var body: some View {
        VStack(spacing: 10) {
            Image(hike.image)
                .resizable()
                .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                .clipShape(.circle)
                .frame(width: 100)
                .onTapGesture {
                    withAnimation {
                        isZoomed.toggle()
                    }
                }
            Text(hike.name)
                .font(.title)
            Text(hike.description)
                .font(.subheadline)
            Spacer()
        }
        .navigationTitle(Text(hike.name))
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        HikeDetailsView(hike: HikeDetail(name: "Hike Name 1", image: "bird",description: "helo heloo heloo"))
    }
}
