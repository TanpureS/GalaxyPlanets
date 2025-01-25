//
//  DataImporter.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 25/01/25.
//

import SwiftData

struct DataImporter {
    let context: ModelContext
    let dataLoader: PlanetService
    
    @MainActor
    func fetchPlanetsData() async throws {
        var descriptor = FetchDescriptor<PlanetModel>()
        descriptor.fetchLimit = 1
        let persistedPlanets = try context.fetch(descriptor)
        
        if persistedPlanets.isEmpty {
            let planets = try await dataLoader.fetchPlanets()
            if !planets.isEmpty {
                planets.forEach { planet in
                    let model = PlanetModel(name: planet.name)
                    context.insert(model)
                }
            }
        }
    }
}
