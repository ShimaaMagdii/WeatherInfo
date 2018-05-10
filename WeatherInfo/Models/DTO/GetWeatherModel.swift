//
//  GetWeatherModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import ObjectMapper

class GetWeatherModel: BaseMappable {
    var base : String?
    var clouds : Cloud?
    var cod : Int?
    var coord : Coord?
    var dt : Int?
    var id : Int?
    var main : Main?
    var name : String?
    var sys : Sy?
    var visibility : Int?
    var weather : [Weather]?
    var wind : Wind?
    
    override func mapping(map: Map)
    {
        base <- map["base"]
        clouds <- map["clouds"]
        cod <- map["cod"]
        coord <- map["coord"]
        dt <- map["dt"]
        id <- map["id"]
        main <- map["main"]
        name <- map["name"]
        sys <- map["sys"]
        visibility <- map["visibility"]
        weather <- map["weather"]
        wind <- map["wind"]
    }
    
}
class Cloud: BaseMappable {
    
    var all : Int?
    
    override func mapping(map: Map)
    {
        all <- map["all"]
    }
}

class Coord: BaseMappable{
    
    var lat : Float?
    var lon : Float?
    
    override func mapping(map: Map)
    {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}

class Main : BaseMappable{
    
    var humidity : Int?
    var pressure : Int?
    var temp : Float?
    var tempMax : Float?
    var tempMin : Float?
    
    override func mapping(map: Map)
    {
        humidity <- map["humidity"]
        pressure <- map["pressure"]
        temp <- map["temp"]
        tempMax <- map["temp_max"]
        tempMin <- map["temp_min"]
    }
}

class Sy :BaseMappable {
    
    var country : String?
    var id : Int?
    var message : Float?
    var sunrise : Int?
    var sunset : Int?
    var type : Int?
    
    override func mapping(map: Map)
    {
        country <- map["country"]
        id <- map["id"]
        message <- map["message"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
        type <- map["type"]
    }
}

class Weather : BaseMappable {
    
    var descriptionField : String?
    var icon : String?
    var id : Int?
    var main : String?
    
    override func mapping(map: Map)
    {
        descriptionField <- map["description"]
        icon <- map["icon"]
        id <- map["id"]
        main <- map["main"]
    }
}

class Wind : BaseMappable {
    
    var deg : Int?
    var speed : Float?
    
    override func mapping(map: Map)
    {
        deg <- map["deg"]
        speed <- map["speed"]
    }
}
