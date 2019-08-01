//
//  ModelManager.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireObjectMapper

class ModelManager {
    
    static let sharedModelManager = ModelManager()
    let movieDescoveryURL = "https://api.themoviedb.org/3/discover/movie"
    let movieDetailsURL = "https://api.themoviedb.org/3/movie"
    let youtubeURL = "http://youtube.com/watch?v="
    let apyKey = "eeae8f8ca034ff17cf51b338b366ad7e"
    
    private init(){
    }
    
    //Get all the movies form the discover endpoint of the API. All object, such as Movie and APIResponseDescover are mappable with the api's response.
    func getMoviesFromApi( completionHandler: @escaping ( APIResponseDescover?, Error?) -> Void) {
        let finalURL = "\(ModelManager.sharedModelManager.movieDescoveryURL)?api_key=\(ModelManager.sharedModelManager.apyKey)"
        print("Request to: \(finalURL)")
        Alamofire.request(finalURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseObject{ (response : DataResponse<APIResponseDescover>) in
            switch response.result {
            case .success:
                print("\(response.value)")
                completionHandler(response.value, nil)
                print("success")
            case .failure(let error):
                completionHandler(nil, error)
                print("error")
            }
            
        }
    }
    
    //Get the list of generes of a movies form the movie endpoint of the API. In discovery api, there are a lot of properties that are the same. So i need only the generes names.
    func getMoviesGenresFromApi( movieID: Int, completionHandler: @escaping ( APIResponseDetails?, Error?) -> Void) {
        let finalURL = "\(ModelManager.sharedModelManager.movieDetailsURL)/\(movieID)?api_key=\(ModelManager.sharedModelManager.apyKey)"
        print("Request to: \(finalURL)")
        Alamofire.request(finalURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseObject{ (response : DataResponse<APIResponseDetails>) in
            switch response.result {
            case .success:
                print("\(response.value)")
                completionHandler(response.value, nil)
                print("success")
            case .failure(let error):
                completionHandler(nil, error)
                print("error")
            }
            
        }
    }
    
    //Get the list of reviews of a movies form the reviews endpoint of the API in english.
    func getReviewsFromApi( movieID: Int, completionHandler: @escaping ( APIResponseReview?, Error?) -> Void) {
        let finalURL = "\(ModelManager.sharedModelManager.movieDetailsURL)/\(movieID)/reviews?api_key=\(ModelManager.sharedModelManager.apyKey)&language=en-US&page=1"
        print("Request to: \(finalURL)")
        Alamofire.request(finalURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseObject{ (response : DataResponse<APIResponseReview>) in
            switch response.result {
            case .success:
                print("\(response.value)")
                completionHandler(response.value, nil)
                print("success")
            case .failure(let error):
                completionHandler(nil, error)
                print("error")
            }
            
        }
    }
    
    //This is an extra resourse that i found in the api documentation, in order to take the movies trailer's ids and make an url to youtube.
    func getVideoFromApi( movieID: Int, completionHandler: @escaping ( APIResponseVideo?, Error?) -> Void) {
        let finalURL = "\(ModelManager.sharedModelManager.movieDetailsURL)/\(movieID)/videos?api_key=\(ModelManager.sharedModelManager.apyKey)&language=en-US"
        print("Request to: \(finalURL)")
        Alamofire.request(finalURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseObject{ (response : DataResponse<APIResponseVideo>) in
            switch response.result {
            case .success:
                print("\(response.value)")
                completionHandler(response.value, nil)
                print("success")
            case .failure(let error):
                completionHandler(nil, error)
                print("error")
            }
            
        }
    }

}
