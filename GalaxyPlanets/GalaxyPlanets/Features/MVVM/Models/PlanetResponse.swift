//
//  Planet.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import Foundation

struct PlanetResponse: Decodable {
    let results: [Planet]
}

struct Planet: Decodable {
    let name: String
}

