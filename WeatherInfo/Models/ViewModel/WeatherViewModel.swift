//
//  WeatherViewModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class WeatherViewModel: BaseViewModel, NSCoding{
    
    var name: String!
    var weatherType: WeatherType!
    var currentTemp: String!
    var date: String!
    
    // MARK: - NSCoding
   func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.weatherType.rawValue, forKey: "weatherType")
        aCoder.encode(self.currentTemp, forKey: "currentTemp")
        aCoder.encode(self.date, forKey: "date")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as? String
        let weatherType = aDecoder.decodeObject(forKey: "weatherType") as? String
        let currentTemp = aDecoder.decodeObject(forKey: "currentTemp") as? String
        let date = aDecoder.decodeObject(forKey: "date") as? String
        let weather =  WeatherType(rawValue: weatherType!)
        self.init(name: name!, weatherType: weather!, currentTemp: currentTemp!, date: date!)
    }
    
    init(name: String, weatherType:WeatherType, currentTemp: String, date: String) {
        self.name = name
        self.weatherType = weatherType
        self.currentTemp = currentTemp
        self.date = date
    }
}
