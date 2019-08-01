//
//  ViewControllerDetails.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/31/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

class ViewControllerDetails: UIViewController {

    var sharedModelManager : ModelManager?
    var movie : Movie?
    
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var overviewTextArea: UITextView!
    @IBOutlet weak var showReviewButton: UIButton!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var movieCategory: UILabel!
    @IBOutlet weak var startRateView: CosmosView!
    @IBOutlet weak var movieRate: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getting the genres of the current movie, and add it to their properties.
        sharedModelManager?.getMoviesGenresFromApi( movieID: movie!.movieID!, completionHandler: {result, error in
            if let result = result{
                self.movie?.movieCategories = result.results!
                self.movieCategory.text = self.getCategoryNames(categories: result.results!)
                self.reloadInputViews()
            }
            if let error = error{
                let alert = UIAlertController(title: "Something went wrong!", message: "Sorry, we're having some problems. Retry in some minutes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("LOG ERROR: Error loading products: \(error.localizedDescription)")
            }
        })
        //Also getting the list of videos that the movies has assosiated.
        sharedModelManager?.getVideoFromApi( movieID: movie!.movieID!, completionHandler: {result, error in
            if let result = result{
                self.movie?.movieTrailerURL = result.results!
            }
            if let error = error{
                let alert = UIAlertController(title: "Something went wrong!", message: "Sorry, we're having some problems. Retry in some minutes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("LOG ERROR: Error loading products: \(error.localizedDescription)")
            }
        })
        
        //Seting all the views and components values.
        playButton.layer.cornerRadius = playButton.frame.width / 2.0
        playButton.layer.masksToBounds = true
        showReviewButton.layer.cornerRadius = 20
        bannerImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(movie!.posterImageURL!)"))
        movieImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(movie!.posterImageURL!)"))
        overviewTextArea.text = movie?.overview
        movieTitleLabel.text = movie?.movieTitle?.uppercased()
        numberOfPeopleLabel.text = "\(movie!.popularity!)"
        self.movieRate.text = "\(movie!.voteAvarage!)"
        startRateView.rating = movie!.voteAvarage!*0.5
        
        
    }
    
    //Function that allows to get all the movie's genre's, and return it in a unificated string
    func getCategoryNames(categories: [MovieCategory]) -> String{
        var arrayName : [String] = []
        for var category in categories{
            arrayName.append(category.categotyName!)
        }
        return arrayName.joined(separator: ", ")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewControllerReviews
        destinationVC.sharedModelManager = self.sharedModelManager!
        destinationVC.movie = self.movie
    }
    @IBAction func showReviewsAction(_ sender: Any) {
        performSegue(withIdentifier: "goToReview", sender: self)
    }
    
    //Acction that allows to redirect to the video url(only if the video was fetched)
    @IBAction func goToYoutubeLink(_ sender: Any) {
        if(!(movie?.movieTrailerURL.isEmpty)!){
            if let url = NSURL(string: (sharedModelManager?.youtubeURL)!+(movie?.movieTrailerURL[0].url)!){
                print(url)
                UIApplication.shared.openURL(url as URL)
            }
        }
    }
}
