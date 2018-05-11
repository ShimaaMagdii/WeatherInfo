//
//  WeatherService.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

typealias WeatherDataClosure = (_ weatherModel: WeatherViewModel) -> Void

class WeatherService: BaseService {
    
    func getWeather(forCity cityName: String, success: @escaping WeatherDataClosure) {
        let path = String(format: ServiceUrls.GET_CITY_WEATHER_URL, cityName)
        showLoading()
        NetworkManager.performRequestWithPath(baseUrl: ServiceUrls.BASE_URL, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { respone in
             self.hideLoading()
            if let weatherDataModel :WeatherModel = Mapper<WeatherModel>().map(JSON: respone as! [String : Any]) {
                let weatherViewModel = self.mapWeatherModelToWeatherViewModel(weatherDataModel)
                success(weatherViewModel)
            }
        }, failure: { error in
            self.handelError(error: error)
        })
    }
    
    func mapWeatherModelToWeatherViewModel (_ weatherModel: WeatherModel) -> WeatherViewModel {
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
