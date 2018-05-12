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
    
    func getWeather(forCity cityName: String, success: @escaping WeatherDataClosure){
        getWeatherFromAPi(forCity: cityName, success:success)
    }
    
    func getCachedCitiesList() -> [WeatherViewModel] {
        var result = [WeatherViewModel]()
        if let cachedWeathers = PersistenceManager.loadNSArray(path: .CitiesWeather) {
            for weather in cachedWeathers {
                result.append(weather as! WeatherViewModel )
            }
        }
        return result
    }
    
    func updateCitiesList(citiesWeatherList: [WeatherViewModel]) {
        let mutableObjects = NSMutableArray()
        for weather in citiesWeatherList {
            mutableObjects.add(weather)
        }
        PersistenceManager.saveNSArray(arrayToSave: mutableObjects, path: .CitiesWeather)
    }
    
    private func getWeatherFromAPi(forCity cityName: String, success: @escaping WeatherDataClosure) {
        let path = String(format: ServiceUrls.GET_CITY_WEATHER_URL, cityName)
        showLoading()
        NetworkManager.performRequestWithPath(baseUrl: ServiceUrls.BASE_URL, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { respone in
            self.hideLoading()
            if let weatherDataModel :WeatherModel = Mapper<WeatherModel>().map(JSON: respone as! [String : Any]) {
                let weatherViewModel = WeatherMapper.mapWeatherModelToWeatherViewModel(weatherDataModel)
                success(weatherViewModel)
            }
        }, failure: { error in
            self.handelError(error: error)
        })
    }
}
