//
//  WeatherViewController+UITableView.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesWeatherList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            citiesWeatherList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            presenter.userRemovedCity(atIndex: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: WeatherCell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.WeatherCellIdentifier, for: indexPath) as! WeatherCell
        cell.configureCell(withWeather: citiesWeatherList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = citiesWeatherList[indexPath.row]
        updateMainUI(withWeatherModel: model)
        let forecastVC = ForecastViewController.create()
        forecastVC.cityName = model.name
        self.navigationController?.pushViewController(forecastVC, animated: true)
    }
}
