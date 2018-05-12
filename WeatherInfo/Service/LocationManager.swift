//
//  LocationManager.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import UIKit
import CoreLocation

protocol LocationUpdateProtocol: class {
    func userLocationUpdated(withCity userCity: String)
    func needLocationPermission()
}
class LocationManager: NSObject {
    
    private var locationManager : CLLocationManager = CLLocationManager()
    private weak var delegate: LocationUpdateProtocol!
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var city: String? {
        didSet{
            delegate.userLocationUpdated(withCity: city!)
        }
    }
    var location: CLLocation?
    
    static let sharedManager: LocationManager = {
        let instance = LocationManager()
        instance.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        instance.locationManager.delegate = instance
        instance.locationManager.requestWhenInUseAuthorization()
        return instance
        
    }()
    
    func setupDelegate(delegate: LocationUpdateProtocol){
        LocationManager.sharedManager.delegate = delegate
        LocationManager.sharedManager.updateLocation()
    }
    
    func updateLocation() -> Void {
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .authorizedWhenInUse {
            self.locationManager.startUpdatingLocation()
        }else{
             delegate.needLocationPermission()
        }
    }
    
    func requestAuthorization(){
        LocationManager.sharedManager.locationManager.requestWhenInUseAuthorization()
    }
    
    func stopLocationManager() {
        LocationManager.sharedManager.locationManager.stopUpdatingLocation()
        LocationManager.sharedManager.locationManager.delegate = nil
    }
}



extension LocationManager : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let latestLocation = locations.last!
        
        if location == nil || location!.horizontalAccuracy > latestLocation.horizontalAccuracy {
            
            location = latestLocation
            stopLocationManager()
            geocoder.reverseGeocodeLocation(latestLocation, completionHandler: { (placemarks, error) in
                if error == nil, let placemark = placemarks, !placemark.isEmpty {
                    self.placemark = placemark.last
                }
                self.parsePlacemarks()
                
            })
        }
    }
    func parsePlacemarks() {
        if location != nil {
            if let placemark = placemark {
                if let city = placemark.locality, !city.isEmpty {
                    self.city = city
                }
                
            }
        }
    }
}
