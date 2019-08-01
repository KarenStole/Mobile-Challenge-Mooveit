//
//  Movie.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable{
    var movieID : Int?
    var movieTitle : String?
    var voteAvarage : Double?
    var listOfReview : [MovieReview] = []
    var releaseDate : String?
    var popularity : Double?
    var overview : String?
    var movieCategories : [MovieCategory] = []
    var movieTrailerURL : [MovieVideo] = []
    var backImageURL : String?
    var posterImageURL : String?
    
    required convenience init?(map: Map) {
        self.init()
        self.mapping(map: map)
    }
    
    func mapping(map: Map) {
        movieID <- (map["id"])
        movieTitle <- map["title"]
        voteAvarage <- map["vote_average"]
        releaseDate <- (map["release_date"])
        popularity <- map["popularity"]
        overview <- map["overview"]
        posterImageURL <- map["poster_path"]
    }
    
    init() {}
    
}
