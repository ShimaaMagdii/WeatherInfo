//
//  ForecastViewController.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/11/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit

protocol ForecastViewControllerProtocol: BaseViewControllerViewProtocol {
    func setForecastsList(forecastsList: [ForecastViewModel])
}

class ForecastViewController: BaseViewController {
    
    @IBOutlet weak var forecastTableView: UITableView!
    
    var cityName: String!
    var presenter: ForecastPresenter!
    var forecastsList = [ForecastViewModel]() {
        didSet{
            forecastTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ForecastPresenter.init(delegate: self)
        presenter.getForecasts(forCity: cityName)
    }
    
    private func setupView(){
        
    }
    

    static func create () -> ForecastViewController {
        return UIStoryboard(name: StoryboardIdentifier.MainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.ForecastVCIdentifier) as! ForecastViewController
    }
}


extension ForecastViewController: ForecastViewControllerProtocol {
    func setForecastsList(forecastsList: [ForecastViewModel]) {
        self.forecastsList = forecastsList
    }
}
