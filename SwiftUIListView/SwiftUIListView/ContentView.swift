//
//  ContentView.swift
//  SwiftUIListView
//
//  Created by Jaydip Gadhiya on 20/02/26.
//

import SwiftUI

struct ContentView: View {
    
    let hikeList: [HikeDetail] = [
        HikeDetail(name: "Sunset Ridge Trail", image: "hike",description: "Scenic sunset ridge views"),
        HikeDetail(name: "Emerald Forest Loop", image: "hike", description: "Peaceful forest nature walk"),
        HikeDetail(name: "Rocky Summit Climb", image: "hike", description: "Challenging rocky summit climb"),
        HikeDetail(name: "Crystal Lake Path", image: "hike", description: "Calm crystal lake trail"),
        HikeDetail(name: "Golden Valley Trek", image: "hike", description: "Vibrant valley flower trek"),
        HikeDetail(name: "Misty Mountain Trail", image: "hike", description: "Misty mountain morning hike"),
        HikeDetail(name: "Canyon Edge Route", image: "hike", description: "Adventurous canyon edge route"),
        HikeDetail(name: "Pinewood Discovery Walk", image: "hike", description: "Quiet pinewood discovery walk"),
        HikeDetail(name: "Riverstone Trail", image: "hike", description: "Relaxing riverside shaded trail")]
    
    fileprivate func setHikeView(_ hike: HikeDetail) -> HStack<TupleView<(some View, VStack<TupleView<(Text, Text)>>)>> {
        return HStack {
            Image(hike.image)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(.circle)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(hike.name)
                    .font(.headline)
                Text(hike.description)
                    .font(.subheadline)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(hikeList) { hike in
                NavigationLink(value: hike) {
                    setHikeView(hike)
                }
                .listRowBackground(Color.white)
            }
            .listStyle(.automatic)
            .navigationTitle(Text("My Hikes"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: HikeDetail.self) { hike in
                HikeDetailsView(hike: hike)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
