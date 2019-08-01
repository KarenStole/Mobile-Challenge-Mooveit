//
//  APIResponseReview.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/31/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import ObjectMapper

class APIResponseReview: Mappable {
    
    var results : [MovieReview]?
    
    
    required convenience init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        results <- (map["results"])
    }
}
