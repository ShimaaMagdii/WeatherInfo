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
    
    func getForecast(forLat lat: Double,andLon lon: Double, success: @escaping ForecastDataClosure) {
        let path = String(format: ServiceUrls.GET_CITY_FORECAST_URL, lat, lon)
        showLoading()
        NetworkManager.performRequestWithPath(baseUrl: ServiceUrls.BASE_URL, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { respone in
            self.hideLoading()
            if let forecastDataModel :ForecastsModel = Mapper<ForecastsModel>().map(JSON: respone as! [String : Any]) {
                let forecastsList = self.mapForecastModelToForecastViewModel(forecastDataModel)
                success(forecastsList)
            }
        }, failure: { error in
            self.handelError(error: error)
        })
    }
    
    func mapForecastModelToForecastViewModel (_ forecastDataModel: ForecastsModel) -> [ForecastViewModel] {
        var forecastsList = [ForecastViewModel]()
        if let forecastsData = forecastDataModel.list {
            
            for forecast in forecastsData {
                
                var highTemp = ""
                var lowTemp = ""
                var weatherType = ""
                var date = ""
                
                if let max = forecast.temp?.max {
                    let convertedTemp = Int(max - 273.15)
                    highTemp = "\(convertedTemp)°"
                }
                if let min = forecast.temp?.min {
                    let convertedTemp = Int(min - 273.15)
                    lowTemp = "\(convertedTemp)°"
                }
                if let main = forecast.weather?[0].main {
                    weatherType = main
                }
                
                if let forecastDate = forecast.dt {
                    let convertedDate = Date(timeIntervalSince1970: forecastDate)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateStyle = .full
                    dateFormatter.dateFormat = "EEEE"
                    dateFormatter.timeStyle = .none
                    date = convertedDate.dayOfTheWeek()
                }
                
                let forecastViewModel = ForecastViewModel(highTemp: highTemp, lowTemp: lowTemp, weatherType: weatherType, date: date)
                forecastsList.append(forecastViewModel)
            }
        }
        
        return forecastsList
    }
}
