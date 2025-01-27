//
//  PlanetsViewModel.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import SwiftUI

/*
    PlanetsViewModel used to fetch data from resource & display on UI
*/

final class PlanetsViewModel: ObservableObject {
    let dataImporter: PlanetImporter
    @Published private(set) var state = State.idle
    
    init(dataImporter: PlanetImporter) {
        self.dataImporter = dataImporter
    }
    
    @MainActor
    func loadData() {
        state = .loading
        Task {
            do {
                let planets = try await dataImporter.fetchPlanetsData()
                state = .loaded(planets)
            } catch {
                state = .failed(error)
            }
        }
    }
}

