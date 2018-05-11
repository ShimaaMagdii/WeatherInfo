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
    
    private(set) var city : City?
    private(set) var cnt : Int?
    private(set) var cod : String?
    private(set) var list : [List]?
    private(set) var message : Float?
    
    override func mapping(map: Map)
    {
        city <- map["city"]
        cnt <- map["cnt"]
        cod <- map["cod"]
        list <- map["list"]
        message <- map["message"]
    }
}

class City : BaseMappable{
    
    private(set) var coord : Coord?
    private(set) var country : String?
    private(set) var id : Int?
    private(set) var name : String?
    private(set) var population : Int?
    
    
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
    
    private(set) var clouds : Cloud?
    private(set) var dt : Double?
    private(set) var dtTxt : String?
    private(set) var main : Main?
    private(set) var weather : [Weather]?
    private(set) var wind : Wind?
    
    override func mapping(map: Map)
    {
        clouds <- map["clouds"]
        dt <- map["dt"]
        dtTxt <- map["dt_txt"]
        main <- map["main"]
        weather <- map["weather"]
        wind <- map["wind"]
    }
}
