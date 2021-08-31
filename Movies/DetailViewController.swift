//
//  DetailViewController.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var runTime: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var genre: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var country: UILabel!
    
    @IBOutlet weak var saveDeleteBtn: UIButton!
    @IBOutlet weak var tagLine: UILabel!
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    var viewModel = DetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func saveTapped(_ sender: Any) {
        
    }
    

}
