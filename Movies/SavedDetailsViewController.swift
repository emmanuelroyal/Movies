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
   
    var viewModel = SavedDetailViewModel()
    
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let data = viewModel.MovieDetails[0]
        title = data.name
        movieImage.image = UIImage(data: data.image as Data)
        runTime.text = data.runTime
        movieTitle.text = data.name
        genre.text = data.genre
       
        
        }
    
    @IBAction func DeletePressed(_ sender: Any) {
        
        let data = SavedMovieModel()
        data.image = viewModel.MovieDetails[0].image
        viewModel.delete(item: data)
        navigationController?.popViewController(animated: true)
        
        
    }
    
}
