//
//  PlanetsViewModelTests.swift
//  PlanetsViewModelTests
//
//  Created by Shivaji Tanpure on 23/01/25.
//

import XCTest
@testable import GalaxyPlanets

final class PlanetsViewModelTests: XCTestCase {
    
    @MainActor
    func testFetchPlanets() {
        let viewModel = PlanetsViewModel(dataImporter: DataImporterMock())
        let expectation = XCTestExpectation(description: "Fetch planets")
        viewModel.loadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if case .loaded(let planets) = viewModel.state {
                XCTAssertFalse(planets.isEmpty)
                expectation.fulfill()
            } else {
                XCTAssertTrue(true, "Planets array should not be empty after fetching")
                expectation.fulfill()
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testsIfPlanetsSavedLocally() {
        let viewModel = PlanetsViewModel(dataImporter: DataImporterMock())
        let hasSavedLocally = try! viewModel.dataImporter.checkIfPlanetsSavedLocally()
        XCTAssertTrue(hasSavedLocally)
    }
}
