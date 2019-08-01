//
//  APIResponseVideo.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/31/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import ObjectMapper

class APIResponseVideo: Mappable {
    
    var results : [MovieVideo]?
    
    
    required convenience init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        results <- (map["results"])
    }
}
