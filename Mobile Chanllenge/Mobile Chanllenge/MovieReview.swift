//
//  Movie Review.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieReview: Mappable{
    
    var userName : String?
    var reviewString : String?
    
    required convenience init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        userName <- (map["author"])
        reviewString <- map["content"]
        
    }
}
