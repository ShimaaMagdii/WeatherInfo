//
//  WeatherInfoUITests.swift
//  WeatherInfoUITests
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import XCTest

class WeatherInfoUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        super.tearDown()
    }
    
    func testSearchBarWorksWithTable() {
        //given
        let app = XCUIApplication()
        let tableView = app.tables.element
        //then
        app.textFields["Enter City Name"].tap()
        app.typeText("Paris")
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        sleep(5)
        XCTAssertTrue(tableView.cells.count > 0)
    }
    
    func testUITableView() {
        //given
        
        let app = XCUIApplication()
        let tableView = app.tables.element
        let lastCell = tableView.cells.element(boundBy: 3)
        tableView.scrollToElement(element: lastCell)
        XCTAssertFalse(tableView.cells.count == 0)
    }
    
}


extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        for _ in 0..<10 {
            swipeUp()
        }
    }
}



