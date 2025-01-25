//
//  NetworkManager.swift
//  GalaxyPlanets
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import Foundation

final class NetworkManager: NSObject {
    // MARK: Properties
    
    static let shared = NetworkManager()
    var session: URLSession?
    
    private static let baseURL = "https://swapi.dev"
    let planetsURL = baseURL + "/api/planets/"
    

    private override init() {
        session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: nil)
    }
}

enum NetWorkError: Error {
    case invalidURL
    case serverError
    case sessionNotStarted
    case unknown
}
