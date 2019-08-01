//
//  MovieCategory.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieCategory: Mappable {
    
    var categoryID : Int?
    var categotyName : String?
    
    required convenience init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        categoryID <- (map["id"])
        categotyName <- map["name"]

    }
}
