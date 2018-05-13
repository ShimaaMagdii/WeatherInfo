////
////  LocationManager.swift
////  WeatherInfo
////
////  Created by Shimaa Magdi on 5/12/18.
////  Copyright © 2018 ShimaaMagdi. All rights reserved.
////

import Foundation
import UIKit
import CoreLocation

enum LocationServiceState {
    case notEnabled
    case denied
    case allowed
    case notDetermined
}

protocol LocationManagerDelegate {
    func locationManager(didUpdateLocation location:CLLocation)
    func locationManager(didUpdateCity cityName:String)
    func locationManager(didChangeAuthorization status:LocationServiceState)
    
}

class LocationManager: NSObject {
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var city: String? {
        didSet{
            delegate?.locationManager(didUpdateCity: city!)
        }
    }
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var delegate: LocationManagerDelegate?
    
    override init() {
        super.init()
        
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    static let shared : LocationManager = {
        let instance = LocationManager()
        return instance
    }()
    
    func getLocationServiceState() -> LocationServiceState {
        if CLLocationManager.locationServicesEnabled() {
            switch(CLLocationManager.authorizationStatus()) {
            case .notDetermined:
                return .notDetermined
            case .restricted, .denied:
                return .denied
            case .authorizedAlways, .authorizedWhenInUse:
                return .allowed
            }
        } else {
            return .notEnabled
        }
    }
    
    func openLocationSettings() {
        UIApplication.shared.open(URL(string:"App-Prefs:root=LOCATION_SERVICES")!, options: [:], completionHandler: nil)
    }
    
    func openAppLocationSetting() {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(URL(string: UIApplicationOpenSettingsURLString)!)
        }
    }
    
    func startUpdatingLocation() {
        self.locationManager!.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.locationManager!.stopUpdatingLocation()
    }
}


extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        self.currentLocation = location
        delegate?.locationManager(didUpdateLocation: location)
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        delegate?.locationManager(didChangeAuthorization:getLocationServiceState())
    }
    
}
