//
//  Constants.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import UIKit

struct ServiceUrls {
    static let AppIDKey = "appid"
    //static let AppID = "03a793d0e9a0c26295281e7f31f2d7e8"
    static let AppID =  "9dc28f87d11bace4c0b50937ae86a285"
    static let BASE_URL :String = "http://api.openweathermap.org/data/2.5/"
    static let GET_CITY_WEATHER_URL :String = "weather?q=%@&appid=\(AppID)"
    static let GET_CITY_FORECAST_URL :String = "forecast/daily?lat=%f&lon=%f&cnt=5&mode=json&appid=\(AppID)"
}



struct StoryboardIdentifier {
    
    static let MainStoryboardIdentifier :String = "Main"
    static let WeatherVCIdentifier :String = "WeatherViewController"
    static let ForecastVCIdentifier :String = "ForecastViewController"
    static let ForecastCellIdentifier :String = "ForecastCell"
    
    
    
}
