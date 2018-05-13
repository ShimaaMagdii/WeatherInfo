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
    let encodedCityName = cityName.addingPercentEncoding(withAllowedCharacters: .decimalDigits)!
        let path = String(format: ServiceUrls.GET_CITY_FORECAST_URL, encodedCityName)
        showLoading()
    
        NetworkManager.performRequestWithPath(baseUrl: ServiceUrls.BASE_URL, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { respone in
            self.hideLoading()
            if let forecastDataModel :ForecastsModel = Mapper<ForecastsModel>().map(JSON: respone as! [String : Any]) {
                let forecastsList = ForecastMapper.mapForecastModelToForecastViewModel(forecastDataModel)
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
   
}
