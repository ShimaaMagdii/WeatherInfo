//
//  ForecastService.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/11/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

typealias ForecastDataClosure = (_ forecastsList: [ForecastViewModel]) -> Void

class ForecastService: BaseService {

    func getForecast(forCity cityName: String, success: @escaping ForecastDataClosure)
    {
        if let cachedObjects = getCachedForecast(forCity: cityName){
            success(cachedObjects)
        }else{
            getForecastFromAPI(forCity: cityName, success: success)
        }
    }
    
    
  private func getForecastFromAPI(forCity cityName: String, success: @escaping ForecastDataClosure) {
        let path = String(format: ServiceUrls.GET_CITY_FORECAST_URL, cityName)
        showLoading()
        NetworkManager.performRequestWithPath(baseUrl: ServiceUrls.BASE_URL, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { respone in
            self.hideLoading()
            if let forecastDataModel :ForecastsModel = Mapper<ForecastsModel>().map(JSON: respone as! [String : Any]) {
                let forecastsList = self.mapForecastModelToForecastViewModel(forecastDataModel)
                self.updateForecastsList(forCity: cityName, forecastsList: forecastsList)
                success(forecastsList)
            }
        }, failure: { error in
            self.handelError(error: error)
        })
    }
    
    
   private func getCachedForecast(forCity cityName:String) -> [ForecastViewModel]? {
        
        if let cachedForecasts = PersistenceManager.loadNSArray(path: .CityForecast, withName: cityName) {
            var result = [ForecastViewModel]()
            for forecast in cachedForecasts {
                result.append(forecast as! ForecastViewModel)
            }
            return result
        }
        return nil
    }
    
   private func updateForecastsList(forCity cityName:String, forecastsList: [ForecastViewModel]) {
        let mutableObjects = NSMutableArray()
        for forecast in forecastsList {
            mutableObjects.add(forecast)
        }
        PersistenceManager.saveNSArray(arrayToSave: mutableObjects, path: .CityForecast, withName: cityName)
    }
    
    private func mapForecastModelToForecastViewModel (_ forecastDataModel: ForecastsModel) -> [ForecastViewModel] {
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
