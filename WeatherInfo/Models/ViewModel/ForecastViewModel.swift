//
//  ForecastViewModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
class ForecastViewModel {
    var highTemp: String!
    var lowTemp: String!
    var weatherType: WeatherType!
    var date: String!
    var day: String!
    
    init(highTemp: String, lowTemp:String, weatherType: WeatherType, date: String, day: String) {
        self.highTemp = highTemp
        self.lowTemp = lowTemp
        self.weatherType = weatherType
        self.date = date
        self.day = day
    }
}
