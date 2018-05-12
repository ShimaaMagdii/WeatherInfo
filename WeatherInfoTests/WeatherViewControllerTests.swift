//
//  WeatherViewControllerTests.swift
//  WeatherInfoTests
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//


import UIKit
import XCTest

@testable import WeatherInfo

class WeatherViewControllerTests: XCTestCase {
    
    //declaring the ViewController under test as an implicitly unwrapped optional
    var weatherVCTests : WeatherViewController!
    
    override func setUp() {
        super.setUp()
        weatherVCTests = WeatherViewController.create()
        
        //load view hierarchy
        if(weatherVCTests != nil) {
            
            weatherVCTests.loadView()
            weatherVCTests.viewDidLoad()
        }
    }
    
    override func tearDown() {
        weatherVCTests = nil
        super.tearDown()
    }
    
    func testViewControllerIsComposedOfTableView() {
        
        XCTAssertNotNil(weatherVCTests.citiesWeatherTable, "citiesWeatherTable under test is not composed of a TableView")
    }
    
    func testControllerConformsToTableViewDelegate() {
        XCTAssert(weatherVCTests.conforms(to: UITableViewDelegate.self), "WeatherViewController under test does not conform to UITableViewDelegate protocol")
        XCTAssert(weatherVCTests.conforms(to: UITableViewDataSource.self), "WeatherViewController under test does not conform to UITableViewDataSource protocol")
    }
    
    func testTableViewViewDelegateIsSet() {
        
        XCTAssertNotNil(self.weatherVCTests.citiesWeatherTable.delegate)
    }
    
    func testControllerImplementsTableViewDelegateMethods() {
        
        XCTAssert(weatherVCTests.responds(to: #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))),"ViewController under test does not implement tableView:numberOfRowsInSection")
        
        XCTAssert(weatherVCTests.responds(to: #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))),"ViewController under test does not implement tableView:didSelectRowAt")
    }
    
}

