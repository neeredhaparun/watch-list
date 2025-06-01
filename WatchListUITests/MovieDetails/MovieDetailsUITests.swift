//
//  MovieDetailsUITests.swift
//  WatchListUITests
//
//  Created by ARMIAMAC on 01/06/25.
//

import XCTest

final class MovieDetailsUITests: XCTestCase {
    
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

    func navigateToMovieDetails() {
        let homeTitle = app.staticTexts["Home"]
        XCTAssertTrue(homeTitle.waitForExistence(timeout: 10))

        let homeScrollView = app.scrollViews["HomeScrollView"]
        XCTAssertTrue(homeScrollView.waitForExistence(timeout: 10))

        let firstMovieCell = app.buttons.matching(identifier: "movie_1").element(boundBy: 0)
        XCTAssertTrue(firstMovieCell.waitForExistence(timeout: 5))
        firstMovieCell.tap()
    }
    
    func testAddToFavorites() {

        navigateToMovieDetails()

        let favoriteButton = app.buttons["FavoriteButton"]
        XCTAssertTrue(favoriteButton.waitForExistence(timeout: 3))
        
        let isFavorited = favoriteButton.value as? String == "true"
        XCTAssertFalse(isFavorited, "Should not be favorited initially")

        favoriteButton.tap()

        let newState = favoriteButton.value as? String == "true"
        XCTAssertTrue(newState, "Should be favorited after tap")
        
    }
    
    func testRemoveFromFavorites () {

        navigateToMovieDetails()

        let favoriteButton = app.buttons["FavoriteButton"]
        XCTAssertTrue(favoriteButton.waitForExistence(timeout: 3))

        let isFavorited = favoriteButton.value as? String == "true"
        XCTAssertTrue(isFavorited, "Should be favorited initially")

        favoriteButton.tap()

        let newState = favoriteButton.value as? String == "true"
        XCTAssertFalse(newState, "Should be not favorited after tap")
    }
    
}
