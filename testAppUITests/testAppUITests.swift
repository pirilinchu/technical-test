//
//  testAppUITests.swift
//  testAppUITests
//
//  Created by Santigo Mendoza on 10/28/23.
//

import XCTest

final class testAppUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDetailsScreenForFirstItem_Success() throws {
        let app = XCUIApplication()
        app.launch()
        
        let timeout = 5.0
        
        let postCard = app.staticTexts["1"]
        XCTAssert(postCard.waitForExistence(timeout: timeout))
        postCard.tap()
        
        let detailsScreen = app.staticTexts["1"]
        XCTAssert(detailsScreen.waitForExistence(timeout: timeout))
    }
}
