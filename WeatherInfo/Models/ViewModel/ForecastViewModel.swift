//
//  ForecastViewModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class ForecastViewModel: BaseViewModel, NSCoding {
    
    var highTemp: String = ""
    var lowTemp: String = ""
    var weatherType: WeatherType = WeatherType.Unknown
    var date: String = ""
    var day: String = ""
    
    init(highTemp: String, lowTemp:String, weatherType: WeatherType, date: String, day: String) {
        self.highTemp = highTemp
        self.lowTemp = lowTemp
        self.weatherType = weatherType
        self.date = date
        self.day = day
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.highTemp, forKey: "highTemp")
        aCoder.encode(self.lowTemp, forKey: "lowTemp")
        aCoder.encode(self.weatherType.rawValue, forKey: "weatherType")
        aCoder.encode(self.date, forKey: "date")
        aCoder.encode(self.day, forKey: "day")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let highTemp = aDecoder.decodeObject(forKey: "highTemp") as? String
        let weatherType = aDecoder.decodeObject(forKey: "weatherType") as? String
        let lowTemp = aDecoder.decodeObject(forKey: "lowTemp") as? String
        let date = aDecoder.decodeObject(forKey: "date") as? String
        let day = aDecoder.decodeObject(forKey: "day") as? String
        let weather =  WeatherType(rawValue: weatherType!)
        self.init(highTemp: highTemp!, lowTemp: lowTemp!, weatherType: weather!, date: date!, day: day!)
    }
}
