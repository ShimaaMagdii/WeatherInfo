//
//  SplashViewController.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit
import CoreLocation

class SplashViewController: BaseViewController {
    let segueIdentifier =  "GoToLandingView"
    var cityName = "London" {
        didSet{
            goToNextView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        actionForLocationStatus()
    }
    
    // MARK: Private Methods
    fileprivate func actionForLocationStatus() {
        switch LocationManager.shared.getLocationServiceState() {
        case .notDetermined:
            LocationManager.shared.delegate = self
        case .allowed:
            LocationManager.shared.startUpdatingLocation()
            LocationManager.shared.delegate = self
        case .denied, .notEnabled:
            goToNextView()
        }
    }
    
    private func goToNextView (){
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let weatherNav = segue.destination as! UINavigationController
            let weatherVC = weatherNav.topViewController as! WeatherViewController
            weatherVC.userCity = cityName
        }
    }
}

extension SplashViewController: LocationManagerDelegate {
    func locationManager(didUpdateCity cityName: String) {
        self.cityName = cityName
    }
    
    func locationManager(didChangeAuthorization status: LocationServiceState) {
        self.actionForLocationStatus()
    }
    
    func locationManager(didUpdateLocation location:CLLocation) {
        let geocoder = CLGeocoder()
        
        if let currentLocation = LocationManager.shared.currentLocation {
            
            LocationManager.shared.stopUpdatingLocation()
            LocationManager.shared.delegate = nil
            
            geocoder.reverseGeocodeLocation(currentLocation, completionHandler: { (placemarks, error) in
                if error == nil, let placemark = placemarks, !placemark.isEmpty {
                    if let country = placemark.last?.country, !country.isEmpty {
                        self.cityName = country
                    }
                }
            })
        }
    }
}
