//
//  TableViewCellReview.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/31/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import UIKit

class TableViewCellReview: UITableViewCell {

    let movieReview : MovieReview? = nil

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userImageview: UIImageView!
 
    @IBOutlet weak var userReviewLabel: UILabel!
    
    override func layoutSubviews() {
        //Making the round style for the avatar image
        userImageview.layer.cornerRadius = userImageview.frame.width / 2.0
        userImageview.layer.masksToBounds = true
    }
}
