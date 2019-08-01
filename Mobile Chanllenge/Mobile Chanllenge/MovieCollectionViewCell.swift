//
//  CollectionViewCell.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    var movie : Movie?
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var moviePointView: UIView!
    @IBOutlet weak var moviePointLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    override func layoutSubviews() {
    moviePointView.layer.cornerRadius = moviePointView.frame.width / 2.0
    moviePointView.layer.masksToBounds = true
    }
}
