//
//  WeatherCell.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/11/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
   
    func configureCell (withWeather weatherModel: WeatherViewModel){
        cityNameLbl.text = weatherModel.name
        temperatureLbl.text = weatherModel.currentTemp
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.addCornerRadius()
        containerView.dropCardShadow()
    }
}
