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
