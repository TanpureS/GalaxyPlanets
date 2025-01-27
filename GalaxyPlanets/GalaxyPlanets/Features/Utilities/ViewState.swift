//
//  ViewState.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 27/01/25.
//

import Foundation

enum State {
    case idle
    case loading
    case failed(Error)
    case loaded([PlanetUIViewModel])
}
