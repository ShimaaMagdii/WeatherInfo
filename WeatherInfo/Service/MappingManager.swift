//
//  MappingManager.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation


class MappingManager {
    
}

typealias WeatherMapper = MappingManager

extension WeatherMapper{
    
    /**
     Map weatherModel to WeatherViewModel.
     
     - Parameter WeatherModel: weatherModel to be mapped.
     - Returns : mapped WeatherViewModel object.
     .
     */
    class func mapWeatherModelToWeatherViewModel (_ weatherModel: WeatherModel) -> WeatherViewModel {
        
        var currentTemp = ""
        var name = ""
        var weatherType = WeatherType.Unknown
        
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        let currentDate = dateFormater.string (from: Date())
        let date = "Today, \(currentDate)"
        
        if let cityName = weatherModel.name {
            name = cityName
        }
        if let main = weatherModel.weather?[0].main, let weatherTypeValue = WeatherType(rawValue: main) {
            weatherType = weatherTypeValue
        }
        if let temp = weatherModel.main?.temp {
            let convertedTemp = Int(temp - 273.15)
            currentTemp = "\(convertedTemp)°"
        }
        return WeatherViewModel(name: name, weatherType: weatherType, currentTemp: currentTemp, date: date)
    }
}

typealias ForecastMapper = MappingManager
extension ForecastMapper{
    /**
     Map ForecastsModel to ForecastViewModel.
     
     - Parameter ForecastsModel: forecastsModel to be mapped.
     - Returns : mapped ForecastViewModel array.
     .
     */
    class func mapForecastModelToForecastViewModel (_ forecastDataModel: ForecastsModel) -> [ForecastViewModel] {
        var forecastsList = [ForecastViewModel]()
        if let forecastsData = forecastDataModel.list {
            
            for forecast in forecastsData {
                
                var highTemp = ""
                var lowTemp = ""
                var weatherType = WeatherType.Unknown
                var date = ""
                var day = ""
                if let max = forecast.main?.tempMax{
                    let convertedTemp = Int(max - 273.15)
                    highTemp = "\(convertedTemp)°"
                }
                if let min = forecast.main?.tempMin{
                    let convertedTemp = Int(min - 273.15)
                    lowTemp = "\(convertedTemp)°"
                }
                if let main = forecast.weather?[0].main, let weatherTypeValue = WeatherType(rawValue: main)  {
                    weatherType = weatherTypeValue
                }
                
                if let forecastDate = forecast.dt {
                    let convertedDate = Date(timeIntervalSince1970: forecastDate)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .full
                    dateFormatter.dateFormat = "EEEE"
                    dateFormatter.timeStyle = .none
                    day = convertedDate.dayOfTheWeek()
                    date = convertedDate.getDate()
                }
                
                let forecastViewModel = ForecastViewModel(highTemp: highTemp, lowTemp: lowTemp, weatherType: weatherType, date: date, day: day)
                
                forecastsList.append(forecastViewModel)
            }
        }
        
        return forecastsList
    }
    
    
    
}
