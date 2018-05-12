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
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var highTemplbl: UILabel!
    @IBOutlet weak var lowTemplbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    func configureCell (withForecast forecastModel: ForecastViewModel){
        highTemplbl.text = forecastModel.highTemp
        lowTemplbl.text = forecastModel.lowTemp
        dateLabel.text = forecastModel.date
        dayLabel.text = forecastModel.day
        weatherIcon.image = UIImage(named: forecastModel.weatherType.rawValue)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addCornerRadius()
        containerView.dropCardShadow()
    }

}
