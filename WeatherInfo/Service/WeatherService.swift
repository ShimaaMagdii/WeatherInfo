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

typealias WeatherDataClosure = (_ weatherModel: GetWeatherModel) -> Void

class WeatherService: BaseService {
    
    func getWeather(forCity cityName: String, success: @escaping WeatherDataClosure) {
        let path = String(format: ServiceUrls.GET_CITY_WEATHER_URL, cityName)
        showLoading()
        NetworkManager.performRequestWithPath(baseUrl: ServiceUrls.BASE_URL, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { respone in
            if let weatherModel :GetWeatherModel = Mapper<GetWeatherModel>().map(JSON: respone as! [String : Any]) {
                success(weatherModel)
            }
        }, failure: { error in
            self.handelError(error: error)
        })
    }
    
}
