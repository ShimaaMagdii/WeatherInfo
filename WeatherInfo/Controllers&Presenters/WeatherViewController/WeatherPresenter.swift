//
//  WeatherPresenter.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class WeatherPresenter {
    var defaultCity = "London" {
        didSet{
            getWeather(forCity: defaultCity)
        }
    }
    let exceedNumberOfCitiesErrorMsg = "You allowed to add only 5 cities"
    let existingCityErrorMsg = "This City already existed"
    let allowedCount = 5
    
    weak private var delegate: WeatherViewControllerProtocol!
    var service :WeatherService = WeatherService()
    var citiesWeatherList = [WeatherViewModel]()
    
    init(delegate: WeatherViewControllerProtocol){
        self.delegate = delegate
        loadWeatherData()
    }
    
    func loadWeatherData (){
        let cachedList = service.getCachedCitiesList()
        if cachedList.count > 0 {
            citiesWeatherList = cachedList
            delegate.setCitiesWeatherList(cachedList)
            delegate.setWeatherModel(cachedList.first!)
        }
    }
    
    func getWeather(forCity cityName: String)
    {
        if Connectivity.isConnectedToInternet {
            service.getWeather(forCity: cityName) { [weak self]
                weatherModel in
                guard let strongSelf = self else { return }
                strongSelf.updateCitiestList(withNewWeatherModel: weatherModel)
            }
        } else {
            delegate.showMessage(WithType: MessageType.Warning, andMsg: "Enable internet connection")
        }
    }
    
    func updateCitiestList(withNewWeatherModel weatherModel: WeatherViewModel) {
            citiesWeatherList = service.getCachedCitiesList()
        if !isExist(weatherModel.name) {
            citiesWeatherList.append(weatherModel)
            delegate.setCitiesWeatherList(self.citiesWeatherList)
            delegate.setWeatherModel(weatherModel)
            service.updateCitiesList(citiesWeatherList: citiesWeatherList)
        }
    }
    
    func userRemovedCity(atIndex index: Int) {
        citiesWeatherList.remove(at: index)
        service.updateCitiesList(citiesWeatherList: citiesWeatherList)
    }
    
    func userAddedNewCity(_ cityName: String){
        if citiesWeatherList.count == allowedCount {
            delegate.showMessage(WithType: MessageType.Warning, andMsg: exceedNumberOfCitiesErrorMsg)
        }else if isExist(cityName) {
            delegate.showMessage(WithType: MessageType.Warning, andMsg: existingCityErrorMsg)
        }else{
            getWeather(forCity: cityName)
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

