//
//  ForecastCell.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/11/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var highTemplbl: UILabel!
    @IBOutlet weak var lowTemplbl: UILabel!
    
    
    
    func configureCell (withForecast forecastModel: ForecastViewModel){
        highTemplbl.text = forecastModel.highTemp
        lowTemplbl.text = forecastModel.lowTemp
        dayLabel.text = forecastModel.date
        weatherIcon.image = UIImage(named: forecastModel.weatherType)
    }
    
    
}
