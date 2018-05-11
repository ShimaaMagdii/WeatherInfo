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
    
    func getForecasts(forLat lat: Double, andLon lon: Double){
        
        service.getForecast(forLat: lat, andLon: lon, success: { forecastsList in
            self.delegate.setForecastsList(forecastsList: forecastsList)
        })
    }
    
}
