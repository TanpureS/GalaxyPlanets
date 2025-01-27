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
    let viewModel: PlanetsViewModel
    
    init(){
        self.viewModel = PlanetsViewModel(dataImporter: DataImporter(context: container.mainContext, dataLoader: PlanetsLoader()))
    }
    
    var body: some Scene {
        WindowGroup {
            PlanetsView(viewModel: viewModel)
                .task {
                    viewModel.loadData()
                }
        }.modelContainer(container)
    }
}
