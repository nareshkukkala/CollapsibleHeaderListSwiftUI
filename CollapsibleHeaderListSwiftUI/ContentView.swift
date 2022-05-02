//
//  ContentView.swift
//  CollapsibleHeaderListSwiftUI
//
//  Created by naresh kukkala on 02/05/22.
//

import SwiftUI

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let hikes: [Hike]
}

struct Hike: Identifiable {
    let id = UUID()
    let name: String
}

private func getAllPlacesWithHikes() -> [Place] {
    return [Place(name: "Pune", hikes: [Hike(name: "Lonavala"), Hike(name: "Baramati"), Hike(name: "Sangali")]),
            Place(name: "Hyderabad", hikes: [Hike(name: "Malkagiri"), Hike(name: "Upala")])
    ]
}

struct ContentView: View {
    
    @State private var places = getAllPlacesWithHikes()
    @State private var selectedName: String?
    @State private var expanded: Bool = false
    
    var body: some View {
        List(places) { place in
            VStack(alignment: .leading) {
                HStack {
                    Text(place.name)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Spacer()
                    Image(systemName: selectedName == place.name ? "chevron.down": "chevron.right")
                        
                }
                .contentShape(Rectangle())
                .onTapGesture(perform: {
                    expanded.toggle()
                    selectedName = expanded ? place.name: nil
                })
                
                if selectedName == place.name {
                    ForEach(place.hikes) { hike in
                        Text(hike.name)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
