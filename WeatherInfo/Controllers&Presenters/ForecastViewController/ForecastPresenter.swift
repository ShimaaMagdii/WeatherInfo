//
//  ForecastPresenter.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/11/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

class ForecastPresenter {
    
    weak private var delegate: ForecastViewControllerProtocol!
    var service :ForecastService = ForecastService()
    
    init(delegate: ForecastViewControllerProtocol){
        self.delegate = delegate
    }
    
    func getForecasts(forCity cityName: String){
        
        service.getForecast(forCity: cityName, success: { [weak self] forecastsList in
            guard let strongSelf = self else { return }
            strongSelf.delegate.setForecastsList(forecastsList: forecastsList)
        })
    }
    
}
