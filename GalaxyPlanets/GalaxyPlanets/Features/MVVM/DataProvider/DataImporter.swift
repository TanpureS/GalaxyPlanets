//
//  DataImporter.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 25/01/25.
//

import SwiftData
import SwiftUI

/*
    PlanetImporter is data provider class primarily check if the data is already stored locally else it will fetch from API and saved locally
*/

protocol PlanetImporter {
    func checkIfPlanetsSavedLocally() throws -> Bool
    @MainActor func fetchPlanetsData() async throws -> [PlanetUIViewModel]
}

final class DataImporter: PlanetImporter {
    @Query private var planets: [PlanetModel]
    var planetsList: [PlanetUIViewModel] = []
    
    let context: ModelContext
    let dataLoader: PlanetsLoader
    
    init(context: ModelContext, dataLoader: PlanetsLoader) {
        self.context = context
        self.dataLoader = dataLoader
    }
    
    func checkIfPlanetsSavedLocally() throws -> Bool {
        var descriptor = FetchDescriptor<PlanetModel>()
        descriptor.fetchLimit = 1
        return try context.fetch(descriptor).isEmpty
    }
    
    @MainActor
    func fetchPlanetsData() async throws -> [PlanetUIViewModel] {
        if try checkIfPlanetsSavedLocally() {
            return try await fetchPlanetsFromAPI()
        } else {
            return try await fetchPlanetsFromLocalStorage()
        }
    }
    
    private func fetchPlanetsFromAPI() async throws -> [PlanetUIViewModel] {
        let planets = try await dataLoader.fetchPlanets()
        try await storePlanetsLocally(planets: planets)
        return try await fetchPlanetsFromLocalStorage()
    }
    
    private func storePlanetsLocally(planets: [Planet]) async throws {
        planets.forEach { planet in
            let model = PlanetModel(name: planet.name)
            context.insert(model)
        }
    }
    
    private func fetchPlanetsFromLocalStorage() async throws -> [PlanetUIViewModel] {
        let descriptor = FetchDescriptor<PlanetModel>()
        let persistedPlanets = try context.fetch(descriptor)
        persistedPlanets.forEach { model in
            planetsList.append(PlanetUIViewModel(id: model.id, name: model.name))
        }
        return planetsList
    }
}
