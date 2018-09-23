//
//  ANLoader_ExampleUITests.swift
//  ANLoader_ExampleUITests
//
//  Created by Anand Nimje on 23/09/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest

class ANLoader_ExampleUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        let showButton = app.buttons["Show"]
        showButton.tap()
        
        let hideButton = app.buttons["Hide"]
        hideButton.tap()
        showButton.tap()
        hideButton.tap()
    }

}
