//
//  APIResponse.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import ObjectMapper

class APIResponseDescover: Mappable {
    
    var results : [Movie]?
    
    
    required convenience init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        results <- (map["results"])
    }
    
}
