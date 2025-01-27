//
//  FakeDataImporter.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 27/01/25.
//

import Foundation
 
struct FakeDataImporter: PlanetImporter {
    
    func fetchPlanetsData() async throws -> [PlanetUIViewModel] {
        return [PlanetUIViewModel(id: "1", name: "Tatooine")]
    }
}
