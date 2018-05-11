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
    
    var presenter: ForecastPresenter!
    var forecastsList = [ForecastViewModel]() {
        didSet{
            print("forecastsList updated = \(forecastsList.count)")
            forecastTableView.reloadData()
        }
    }
    
    @IBOutlet weak var forecastTableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = ForecastPresenter.init(delegate: self)
        
        let lat = 37.33233141
        let lon = -122.0312186
        presenter.getForecasts(forLat: lat, andLon: lon)
        
    }
    
    private func setupView(){
        self.title = "test"
        self.navigationController?.title = "testeer"
        
    }
    
    
    
    static func create () -> ForecastViewController {
        return UIStoryboard(name: StoryboardIdentifier.MainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.ForecastVCIdentifier) as! ForecastViewController
    }
}
extension ForecastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ForecastCell = tableView.dequeueReusableCell(withIdentifier: StoryboardIdentifier.ForecastCellIdentifier, for: indexPath) as! ForecastCell
        cell.configureCell(withForecast: forecastsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(forecastsList[indexPath.row].highTemp)
    }
}

extension ForecastViewController: ForecastViewControllerProtocol {
    func setForecastsList(forecastsList: [ForecastViewModel]) {
        self.forecastsList = forecastsList
    }
}
