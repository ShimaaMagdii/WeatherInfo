//
//  WeatherViewController.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit

protocol WeatherViewControllerProtocol: BaseViewControllerViewProtocol {
   
}

class WeatherViewController: BaseViewController {
 
    var presenter: WeatherPresenter!
//    @IBOutlet weak var userInfoView: UIView!
//    @IBAction func userSelectSegment(_ sender: UIButton) {
//       
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = WeatherPresenter.init(delegate: self)
        presenter.getWeather(forCity: "London")
       
    }
    
    private func setupView(){
        

    }
    
    

    static func create () -> WeatherViewController {
        return UIStoryboard(name: StoryboardIdentifier.MainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.WeatherVCIdentifier) as! WeatherViewController
    }
}

extension WeatherViewController: WeatherViewControllerProtocol {
    
}
