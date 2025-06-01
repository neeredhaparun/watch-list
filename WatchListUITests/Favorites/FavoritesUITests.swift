//
//  FavoritesUITests.swift
//  WatchListUITests
//
//  Created by ARMIAMAC on 01/06/25.
//

import XCTest

final class FavoritesUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func goToFavoritesTab() {
        let homeView = app.scrollViews["HomeScrollView"]
        XCTAssertTrue(homeView.waitForExistence(timeout: 10), "Home view not loaded by default")

        let heartTab = app.images["heart_tab"]
        XCTAssertTrue(heartTab.waitForExistence(timeout: 5), "Heart tab not found")
        heartTab.tap()

        let favoritesView = app.scrollViews["FavoritesScrollView"]
        XCTAssertTrue(favoritesView.waitForExistence(timeout: 5), "Favorites view did not appear after tapping heart tab")
    }
    
    func testPopulatedFavoritesView() {
        app.launchArguments.append("UITesting")
        app.launchEnvironment["UITEST_PREPOPULATE"] = "YES"
        app.launch()

        goToFavoritesTab()
        
        let favoritesScroll = app.scrollViews["FavoritesScrollView"]
        XCTAssertTrue(favoritesScroll.buttons.count > 0)

    }
    
    func testEmptyFavoritesView() throws {
        app.launchArguments.append("UITesting")
        app.launch()

        goToFavoritesTab()

        let favoritesScroll = app.scrollViews["FavoritesScrollView"]
        XCTAssertEqual(favoritesScroll.buttons.count, 0)
        XCTAssertTrue(app.staticTexts["No movies are added to favorite list"].exists)
    }
    
}
