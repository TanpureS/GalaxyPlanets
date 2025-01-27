//
//  PlanetAPIService.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import Foundation

/*
    PlanetsLoader utility used for fetching planets data asynchronously from API first time when app launch
*/

final class PlanetsLoader {
    
    // MARK: API
    func fetchPlanets() async throws -> [Planet] {
        guard let url = URL(string:  NetworkManager.shared.planetsURL) else {
            throw NetWorkError.invalidURL
        }
        guard let session = NetworkManager.shared.session else {
            throw NetWorkError.sessionNotStarted
        }
        
        let (data, response) = try await session.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            throw NetWorkError.serverError
        }
        
        let apiResponse = try JSONDecoder().decode(PlanetResponse.self, from: data)
        return apiResponse.results
    }
}

