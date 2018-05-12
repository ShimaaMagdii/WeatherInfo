//
//  MappingManagerTests.swift
//  WeatherInfoTests
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import XCTest
import ObjectMapper

@testable import WeatherInfo

class MappingManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testMapWeatherModelToWeatherViewModel(){
 
        if let json = readJsonData(fileName: "weatherData") {
            
            let  weatherData:  WeatherModel = Mapper<WeatherModel>().map(JSONObject: json)!
            
            XCTAssertNotNil(weatherData)
            XCTAssertEqual(weatherData.name, "Paris")
            
            let weatherModel: WeatherViewModel =
                WeatherMapper.mapWeatherModelToWeatherViewModel(weatherData)
            
            XCTAssertNotNil(weatherModel)
            XCTAssertEqual(weatherModel.weatherType, WeatherType.Rain)
            
            XCTAssertEqual(weatherModel.name, "Paris")
        }
        
    }
    
    func testMapForecastModelToForecastViewModel (){
        
        if let json = readJsonData(fileName: "forecastData") {
            
            let  forecastData:  ForecastsModel = Mapper<ForecastsModel>().map(JSONObject: json)!
            
            XCTAssertNotNil(forecastData)
            XCTAssertEqual(forecastData.list?.count, 5)
            
            let forecastList: [ForecastViewModel] =
                ForecastMapper.mapForecastModelToForecastViewModel(forecastData)
            
            XCTAssertNotNil(forecastList)
            XCTAssertEqual(forecastList.count, 5)
            
            XCTAssertEqual(forecastList.first?.weatherType, WeatherType.Clear)
             XCTAssertEqual(forecastList.last?.weatherType, WeatherType.Clear)
        }
        
    }
  
    private func readJsonData(fileName: String) -> [String : Any]? {
        var jsonResult: [String:Any]?
        do {
            let testBundle = Bundle(for: type(of: self))
            if let file = testBundle.url(forResource:fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    jsonResult =  object
                } else if let object = json as? [Any] {
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return jsonResult
    }
}

