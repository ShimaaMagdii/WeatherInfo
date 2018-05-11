//
//  WeatherViewController.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit

protocol WeatherViewControllerProtocol: BaseViewControllerViewProtocol {
    func setWeatherModel(_ weatherModel: WeatherViewModel)
    func setCitiesWeatherList(_ citiesWeatherList: [WeatherViewModel])
}

class WeatherViewController: BaseViewController {
    
    var presenter: WeatherPresenter!
    var citiesWeatherList = [WeatherViewModel]()
    var weatherModel: WeatherViewModel! {
        didSet{
            updateMainUI(withWeatherModel: weatherModel)
        }
    }
    
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var weatherTypelbl: UILabel!
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var citiesWeatherTable: UITableView!
    @IBOutlet weak var searchTxtField: UITextField!
    
    @IBAction func searchPressed(_ sender: UIButton) {
        checkUserInput()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter = WeatherPresenter.init(delegate: self)
        presenter.getWeather(forCity: "London")
    }
    
    private func setupView(){
        searchTxtField.delegate = self
    }
    
    internal func updateMainUI(withWeatherModel weatherModel: WeatherViewModel){
        cityNameLbl.text = weatherModel.name
        tempLbl.text = weatherModel.currentTemp
        datelbl.text = weatherModel.date
        weatherTypelbl.text = weatherModel.weatherType.rawValue
        weatherIcon.image = UIImage(named: weatherModel.weatherType.rawValue)
    }
    
    private func checkUserInput(){
        let cityName = searchTxtField.text
        if cityName != "" {
            presenter.userAddedNewCity(cityName!)
        }
        self.view.endEditing(true)
    }
    
    static func create () -> WeatherViewController {
        return UIStoryboard(name: StoryboardIdentifier.MainStoryboardIdentifier, bundle: Bundle.main).instantiateViewController(withIdentifier: StoryboardIdentifier.WeatherVCIdentifier) as! WeatherViewController
    }
}

extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkUserInput()
        return true
    }
}

extension WeatherViewController: WeatherViewControllerProtocol {
    func setWeatherModel(_ weatherModel: WeatherViewModel){
        self.weatherModel = weatherModel
    }
    
    func setCitiesWeatherList(_ citiesWeatherList: [WeatherViewModel]) {
        self.citiesWeatherList = citiesWeatherList
        citiesWeatherTable.reloadData()
    }
}
