//
//  PersistenceManager.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/12/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation

enum Path: String {
    case CitiesWeather = "CitiesWeather"
    case CityForecast = "CityForecast"
}

class PersistenceManager {
    class private func documentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths[0] as String
        return documentDirectory as NSString
    }
    
    class func saveNSArray(arrayToSave: NSArray, path: Path, withName: String = "") {
        let pathUrl = !withName.isEmpty ? path.rawValue + withName : path.rawValue
        let file = documentsDirectory().appendingPathComponent(pathUrl)
        NSKeyedArchiver.archiveRootObject(arrayToSave, toFile: file)
    }
    
    class func loadNSArray(path: Path, withName: String = "") -> NSArray? {
        let pathUrl = !withName.isEmpty ? path.rawValue + withName : path.rawValue
        let file = documentsDirectory().appendingPathComponent(pathUrl)
        let result = NSKeyedUnarchiver.unarchiveObject(withFile: file)
        return result as? NSArray
    }
}
