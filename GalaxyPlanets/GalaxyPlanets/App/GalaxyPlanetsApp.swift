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
    let dataImporter: DataImporter
    
    init(){
        self.dataImporter = DataImporter(context: container.mainContext, dataLoader: dataLoader)
    }
    
    var body: some Scene {
        WindowGroup {
            PlanetsView()
                .task {
                    do {
                        try await dataImporter.fetchPlanetsData()
                    } catch {
                        print(error)
                    }
                }
        }.modelContainer(container)
    }
}
