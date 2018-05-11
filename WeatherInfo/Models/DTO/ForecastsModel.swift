//
//  ForecastsModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/11/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import ObjectMapper

class ForecastsModel: BaseMappable{
    
    var city : City?
    var cnt : Int?
    var cod : String?
    var list : [List]?
    var message : Float?
    
    override func mapping(map: Map)
    {
        city <- map["city"]
        cnt <- map["cnt"]
        cod <- map["cod"]
        list <- map["list"]
        message <- map["message"]
    }
    
}
class Temp : BaseMappable{
    
    var day : Float?
    var eve : Float?
    var max : Double?
    var min : Double?
    var morn : Float?
    var night : Float?
    
    override func mapping(map: Map)
    {
        day <- map["day"]
        eve <- map["eve"]
        max <- map["max"]
        min <- map["min"]
        morn <- map["morn"]
        night <- map["night"]
    }
}

class City : BaseMappable{
    
    var coord : Coord?
    var country : String?
    var id : Int?
    var name : String?
    var population : Int?
    
    
    override func mapping(map: Map)
    {
        coord <- map["coord"]
        country <- map["country"]
        id <- map["id"]
        name <- map["name"]
        population <- map["population"]
    }
}

class List : BaseMappable{
    
    var clouds : Int?
    var deg : Int?
    var dt : Double?
    var humidity : Int?
    var pressure : Float?
    var speed : Float?
    var temp : Temp?
    var weather : [Weather]?
    
    override func mapping(map: Map)
    {
        clouds <- map["clouds"]
        deg <- map["deg"]
        dt <- map["dt"]
        humidity <- map["humidity"]
        pressure <- map["pressure"]
        speed <- map["speed"]
        temp <- map["temp"]
        weather <- map["weather"]
    }
}
