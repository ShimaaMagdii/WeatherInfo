//
//  BaseMappable.swift
//  WeatherInfo
//
//  Created by Shimaa Magdi on 5/10/18.
//  Copyright © 2018 ShimaaMagdi. All rights reserved.
//

import Foundation
import ObjectMapper

class BaseMappable: Mappable {
    
    private(set) var StatusCode : Int?
    
    required init?(map: Map) {
    }
    
    init() {
        
    }
    
    /**
     Mapping from API
     */
    func mapping(map: Map) {
        StatusCode   <- map[MappingKey.StatusCode]
    }
    
}

fileprivate struct MappingKey {
    static let StatusCode             : String = "StatusCode"
}
