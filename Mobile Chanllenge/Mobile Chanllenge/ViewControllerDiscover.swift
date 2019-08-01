//
//  ViewController.swift
//  Mobile Chanllenge
//
//  Created by Jose Soarez on 7/30/19.
//  Copyright © 2019 Jose Soarez. All rights reserved.
//

import UIKit
import Kingfisher

class ViewControllerDiscover: UIViewController {
    
    let sharedModelManager = ModelManager.sharedModelManager
    var listOfMovies: [Movie] = []
    var currentMovie : Movie?

    @IBOutlet weak var movieCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sharedModelManager.getMoviesFromApi(completionHandler: {result, error in
            if let result = result{
                self.listOfMovies = result.results!
                self.listOfMovies = self.listOfMovies.sorted(by: { $0.voteAvarage! > $1.voteAvarage! })
                self.movieCollectionView.reloadData()
            }
            if let error = error{
                let alert = UIAlertController(title: "Something went wrong!", message: "Sorry, we're having some problems. Retry in some minutes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
                print("LOG ERROR: Error loading products: \(error.localizedDescription)")
            }
        })
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension ViewControllerDiscover : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(listOfMovies.isEmpty){
            return 1
        }else{
            return listOfMovies.count
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! MovieCollectionViewCell
        
        if(listOfMovies.isEmpty){
            cell.movieTitleLabel.text = "Loading..."
            cell.movieDateLabel.text = ""
        }
        else{
           // http://image.tmdb.org/t/p/original/
            let fullDateArr = listOfMovies[indexPath.row].releaseDate!.components(separatedBy: "-")
            cell.movieDateLabel.text = fullDateArr[0]
            //var firstName: String = fullNameArr[0]
            cell.movieImageView.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/original/\(listOfMovies[indexPath.row].posterImageURL!)"))
            cell.moviePointLabel.text = String(describing: listOfMovies[indexPath.row].voteAvarage!)
            cell.movieTitleLabel.text = listOfMovies[indexPath.row].movieTitle
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 10
        let collectionCellSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionCellSize/2, height: collectionCellSize*0.70)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewControllerDetails
        destinationVC.sharedModelManager = self.sharedModelManager
        destinationVC.movie = currentMovie
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentMovie = listOfMovies[indexPath.row]
        performSegue(withIdentifier: "goToDetails", sender: self)
    }

    }
    
    


