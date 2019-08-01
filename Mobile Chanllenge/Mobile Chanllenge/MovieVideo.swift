//
//  MovieVideo.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/31/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieVideo: Mappable {
    var id : String?
    var url : String?
    
    required convenience init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- (map["id"])
        url <- map["key"]
        
    }
}
