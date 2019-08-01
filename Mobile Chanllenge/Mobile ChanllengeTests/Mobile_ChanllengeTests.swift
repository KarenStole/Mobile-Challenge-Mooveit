//
//  Mobile_ChanllengeTests.swift
//  Mobile ChanllengeTests
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import XCTest
@testable import Mobile_Chanllenge

class Mobile_ChanllengeTests: XCTestCase {
    let sharedModelManager = ModelManager.sharedModelManager
    func testGettingMovies() {
        var result : APIResponseDescover?
        var error : Error?
        
        sharedModelManager.getMoviesFromApi(completionHandler: (result, error in {}))
        
        
    }

}
