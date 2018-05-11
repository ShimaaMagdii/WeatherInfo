//
//  WeatherViewModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class WeatherViewModel {
    var name: String!
    var weatherType: WeatherType!
    var currentTemp: String!
    var date: String!
    
    init(name: String, weatherType:WeatherType, currentTemp: String, date: String) {
        self.name = name
        self.weatherType = weatherType
        self.currentTemp = currentTemp
        self.date = date
    }
}
