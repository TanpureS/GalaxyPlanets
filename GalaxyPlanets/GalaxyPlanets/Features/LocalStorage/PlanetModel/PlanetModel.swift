//
//  PlanetModel.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 25/01/25.
//

import Foundation
import SwiftData

@Model
class PlanetModel: Identifiable {
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}

