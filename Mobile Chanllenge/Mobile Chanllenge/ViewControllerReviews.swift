//
//  ViewControllerReviews.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/31/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import UIKit
import Kingfisher

class ViewControllerReviews: UIViewController {

    var sharedModelManager = ModelManager.sharedModelManager
    var movie : Movie?
    var reviews : [MovieReview?] = []
    var stillEmpty = false
    @IBOutlet weak var movieImageView: UIImageView!

    @IBOutlet weak var numberOfReviewLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set a dinamic dimension of the cell, depending on the large of the review text
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        movieImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(movie!.posterImageURL!)"))

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Getting the reviews from the Api
        sharedModelManager.getReviewsFromApi(movieID: movie!.movieID!, completionHandler: {result, error in
            if let result = result{
                self.reviews = result.results!
                self.numberOfReviewLabel.text = "(\(self.reviews.count))"
                if(self.reviews.isEmpty){
                    self.stillEmpty = true
                }
                self.tableView.reloadData()
            }
            if let error = error{
                let alert = UIAlertController(title: "Something went wrong!", message: "Sorry, we're having some problems. Retry in some minutes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("LOG ERROR: Error loading products: \(error.localizedDescription)")
            }
        })
    }

}
extension ViewControllerReviews: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //If there is no response from the api yet
        if (reviews.isEmpty && !stillEmpty){
            return 1
        }
        //In the apis give us a response, but there is no reviews
        else if(stillEmpty){
            return 0
        }else{
            return reviews.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! TableViewCellReview
        cell.selectionStyle = .none
        if(reviews.isEmpty){
            cell.userNameLabel.text = "Loading..."
        }else{
            cell.userNameLabel.text = reviews[indexPath.row]?.userName
            cell.userReviewLabel.text = reviews[indexPath.row]?.reviewString
            
        }
        
        return cell
    }
    
    
    
}

