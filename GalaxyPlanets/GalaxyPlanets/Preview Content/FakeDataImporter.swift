//
//  FakeDataImporter.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 27/01/25.
//

import Foundation

/*
    FakeDataImporter user for previews
*/
 
struct FakeDataImporter: PlanetImporter {
    
    func checkIfPlanetsSavedLocally() throws -> Bool {
        false
    }
    
    func fetchPlanetsData() async throws -> [PlanetUIViewModel] {
        return [PlanetUIViewModel(id: "1", name: "Tatooine")]
    }
}
