//
//  DataImporterMock.swift
//  GalaxyPlanetsTests
//
//  Created by Shivaji Tanpure on 27/01/25.
//

import XCTest
@testable import GalaxyPlanets

struct DataImporterMock: PlanetImporter {
    
    func checkIfPlanetsSavedLocally() throws -> Bool {
        true
    }
    
    func fetchPlanetsData() async throws -> [PlanetUIViewModel] {
        return [PlanetUIViewModel(id: "1", name: "Tatooine")]
    }
}
