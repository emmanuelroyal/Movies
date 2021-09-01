//
//  SavedDetailsViewController.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import UIKit

class SavedDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    
    var viewModel = SavedDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    @IBAction func DeletePressed(_ sender: Any) {
        
        let data = SavedMovieModel()
        data.image = viewModel.MovieDetails[0].image
        viewModel.delete(item: data)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    
    func configureUI() {
        
        DispatchQueue.main.async{ [self] in
            let data = viewModel.MovieDetails[0]
            movieImage.image = UIImage(data: data.image as Data)
            runTime.text = data.runTime
            movieTitle.text! += data.name
            genre.text = data.genre
            overview.text = data.overview
            releaseDate.text = data.releaseDate
            
        }
        
    }
}

