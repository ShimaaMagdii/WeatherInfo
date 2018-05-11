//
//  WeatherModel.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/11/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherModel: BaseMappable {
    
    private(set) var base : String?
    private(set) var clouds : Cloud?
    private(set) var cod : Int?
    private(set) var coord : Coord?
    private(set) var dt : Int?
    private(set) var id : Int?
    private(set) var main : Main?
    private(set) var name : String?
    private(set) var sys : Sy?
    private(set) var visibility : Int?
    private(set) var weather : [Weather]?
    private(set) var wind : Wind?
    
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
    
    private(set) var all : Int?
    
    override func mapping(map: Map)
    {
        all <- map["all"]
    }
}

class Coord: BaseMappable{
    
    private(set) var lat : Float?
    private(set) var lon : Float?
    
    override func mapping(map: Map)
    {
        lat <- map["lat"]
        lon <- map["lon"]
    }
}

class Main : BaseMappable{
    
    private(set) var humidity : Int?
    private(set) var pressure : Int?
    private(set) var temp : Double?
    private(set) var tempMax : Double?
    private(set) var tempMin : Double?
    
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
    
    private(set) var country : String?
    private(set) var id : Int?
    private(set) var message : Float?
    private(set) var sunrise : Int?
    private(set) var sunset : Int?
    private(set) var type : Int?
    
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
    
    private(set) var descriptionField : String?
    private(set) var icon : String?
    private(set) var id : Int?
    private(set) var main : String?
    
    override func mapping(map: Map)
    {
        descriptionField <- map["description"]
        icon <- map["icon"]
        id <- map["id"]
        main <- map["main"]
    }
}

class Wind : BaseMappable {
    
    private(set) var deg : Int?
    private(set) var speed : Float?
    
    override func mapping(map: Map)
    {
        deg <- map["deg"]
        speed <- map["speed"]
    }
}
