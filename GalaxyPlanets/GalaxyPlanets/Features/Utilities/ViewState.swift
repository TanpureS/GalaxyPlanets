//
//  ViewState.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 27/01/25.
//

import Foundation

/*
    State used by view model & view to re-render based on state value
*/

enum State {
    case idle
    case loading
    case failed(Error)
    case loaded([PlanetUIViewModel])
}
