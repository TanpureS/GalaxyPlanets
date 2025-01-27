//
//  ContentView.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import SwiftUI
import SwiftData

struct PlanetsView: View {
    
    @ObservedObject var viewModel: PlanetsViewModel

    var body: some View {
        NavigationStack {
            
            switch viewModel.state {
                
            case .idle:
                EmptyView()
                
            case .loading:
                ProgressView()
                
            case .failed:
                EmptyView()
                
            case .loaded(let planets):
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
}


#Preview {
    PlanetsView(
        viewModel: PlanetsViewModel(
                        dataImporter: FakeDataImporter()
                    )
            )
}



