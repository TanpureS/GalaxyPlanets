//
//  GalaxyPlanetsApp.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import SwiftUI
import SwiftData

@main
struct GalaxyPlanetsApp: App {
    

    let container = try! ModelContainer(for: PlanetModel.self)
    let dataLoader = PlanetsLoader()
    
    @MainActor
    private func fetchPlanetsData() async {
        let context = container.mainContext
        
        do {
            
            let planets = try await dataLoader.fetchPlanets()
            
//            if !planets.isEmpty {
//                planets.forEach { planet in
//                    let model = PlanetModel(name: planet.name)
//                    context.insert(model)
//                }
//            }
            
        } catch {
            print(error)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            PlanetsView()
                .task {
                    await fetchPlanetsData()
                }
        }.modelContainer(container)
    }
}
