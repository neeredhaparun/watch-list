//
//  HomeUITests.swift
//  WatchListUITests
//
//  Created by ARMIAMAC on 01/06/25.
//

import XCTest

final class HomeUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchEnvironment["UITesting"] = "true"
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testMoviesAreVisible() {
        let homeScroll = app.scrollViews["HomeScrollView"]
        XCTAssertTrue(homeScroll.waitForExistence(timeout: 5))
        
        // Wait for cells to load
        let movieCell = app.buttons.matching(identifier: "movie_1").firstMatch
        XCTAssertTrue(movieCell.waitForExistence(timeout: 10), "No movie cells found")
    }
    
    func testNavigationToMovieDetails() {
        let homeTitle = app.staticTexts["Home"]
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 10))

        let homeScrollView = app.scrollViews["HomeScrollView"]
        XCTAssertTrue(homeScrollView.waitForExistence(timeout: 10))

        let firstMovieCell = app.buttons.matching(identifier: "movie_1").element(boundBy: 0)
        XCTAssertTrue(firstMovieCell.waitForExistence(timeout: 5))
        firstMovieCell.tap()
        
        let detailView = app.scrollViews["MovieDetailsView"]
        XCTAssertTrue(detailView.waitForExistence(timeout: 10), "MovieDetailsView did not appear")
    }
    
}
