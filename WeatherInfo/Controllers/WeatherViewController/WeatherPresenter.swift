//
//  WeatherPresenter.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class WeatherPresenter {
    
    weak private var delegate: WeatherViewControllerProtocol!
    var service :WeatherService = WeatherService()
    
    init(delegate: WeatherViewControllerProtocol){
        self.delegate = delegate
    }
    
    func getWeather(forCity cityName: String)
    {
        service.getWeather(forCity: cityName) { weatherModel in
            print(weatherModel.toJSON())
        }
    }

}
