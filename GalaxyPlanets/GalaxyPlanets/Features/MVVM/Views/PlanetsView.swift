//
//  ContentView.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import SwiftUI
import SwiftData

struct PlanetsView: View {
    
    @Query private var planets: [PlanetModel]
    var body: some View {
        NavigationStack {
            List {
                ForEach(planets) { planet in
                    Text(planet.name)
                        .titleStyle()
                }
            }
            .navigationTitle("Planets")
        }
    }
}

#Preview {
    PlanetsView()
}



