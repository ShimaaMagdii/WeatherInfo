//
//  BaseViewModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class BaseViewModel : NSObject{
    
}

class WeatherViewModel {
    var name: String!
    var weatherType: String!
    var currentTemp: Double!
    var date: String!
    
    init(name: String, weatherType:String, currentTemp: Double, date: String) {
        self.name = name
        self.weatherType = weatherType
        self.currentTemp = currentTemp
        self.date = date
    }
}

class ForecastViewModel {
    var highTemp: String!
    var lowTemp: String!
    var weatherType: String!
    var date: String!

    
    init(highTemp: String, lowTemp:String, weatherType: String, date: String) {
        self.highTemp = highTemp
        self.lowTemp = lowTemp
        self.weatherType = weatherType
        self.date = date
    }
}

