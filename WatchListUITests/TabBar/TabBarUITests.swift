//
//  TabBarUITests.swift
//  WatchListUITests
//
//  Created by ARMIAMAC on 01/06/25.
//

import XCTest

final class TabBarUITests: XCTestCase {
    
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

    func testTabBarNavigation() {
        let homeView = app.scrollViews["HomeScrollView"]
        XCTAssertTrue(homeView.waitForExistence(timeout: 10), "Home view not loaded by default")

        let heartTab = app.images["heart_tab"]
        XCTAssertTrue(heartTab.waitForExistence(timeout: 5), "Heart tab not found")
        heartTab.tap()

        let favoritesView = app.scrollViews["FavoritesScrollView"]
        XCTAssertTrue(favoritesView.waitForExistence(timeout: 5), "Favorites view did not appear after tapping heart tab")

        let houseTab = app.images["house_tab"]
        XCTAssertTrue(houseTab.waitForExistence(timeout: 5), "House tab not found")
        houseTab.tap()
        
        XCTAssertTrue(homeView.waitForExistence(timeout: 5), "Home view did not reappear after tapping house tab")
    }

}
