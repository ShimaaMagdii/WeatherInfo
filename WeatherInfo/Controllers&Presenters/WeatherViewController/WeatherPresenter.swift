//
//  WeatherPresenter.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class WeatherPresenter {
    
    let exceedNumberOfCitiesErrorMsg = "You allowed to add only 5 cities"
    let existingCityErrorMsg = "This City already existed"
    let allowedCount = 5
    
    weak private var delegate: WeatherViewControllerProtocol!
    var service :WeatherService = WeatherService()
    var citiesWeatherList = [WeatherViewModel]()
    
    init(delegate: WeatherViewControllerProtocol){
        self.delegate = delegate
    }
    
    func getWeather(forCity cityName: String)
    {
        service.getWeather(forCity: cityName) { [weak self] weatherModel in
            guard let strongSelf = self else { return }
            strongSelf.citiesWeatherList.append(weatherModel)
            strongSelf.delegate.setCitiesWeatherList(strongSelf.citiesWeatherList)
            strongSelf.delegate.setWeatherModel(weatherModel)
        }
    }
    
    func userRemovedCity(atIndex index: Int) {
        citiesWeatherList.remove(at: index)
    }
    
    func userAddedNewCity(_ cityName: String){
        if citiesWeatherList.count == allowedCount {
             self.delegate.showMessage(WithType: MessageType.Warning, andMsg: exceedNumberOfCitiesErrorMsg)
        }else if isExist(cityName) {
            self.delegate.showMessage(WithType: MessageType.Warning, andMsg: existingCityErrorMsg)
        }else{
             self.getWeather(forCity: cityName)
        }
    }
    
    private func isExist(_ city: String) -> Bool {
        let cities = citiesWeatherList.compactMap{$0.name}
        for cityName in cities {
            if cityName.uppercased() == city.uppercased() {
                return true
            }
        }
        return false
    }
}
