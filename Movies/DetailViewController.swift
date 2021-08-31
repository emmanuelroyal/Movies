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
    
    let formatter: DateComponentsFormatter = {
        
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
        
    }()

    
   
    fileprivate func configureUIBeforeNetworkCallIsOver() {
        title = viewModel.movieDetails[0].name
        movieTitle.text = viewModel.movieDetails[0].name
        releaseDate.text = viewModel.movieDetails[0].releaseDate
        movieImage.image = UIImage(systemName: "photo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIBeforeNetworkCallIsOver()
        
        
        
        configureUI()
    }
    
    
    
        
    @IBAction func saveTapped(_ sender: Any) {
        guard viewModel.movies.count > 0 else { return }
        let movieToSave = SavedMovieModel()
        movieToSave.country = country.text!
        movieToSave.genre = genre.text!
        movieToSave.image = movieImage.image
        movieToSave.liked = true
        movieToSave.name = movieTitle.text!
        movieToSave.rating = String(viewModel.movies[0].voteAverage)
        movieToSave.releaseDate = releaseDate.text!
        movieToSave.runTime = runTime.text!
        movieToSave.tagLine = tagLine.text!
        
        viewModel.create(item: movieToSave)
    
        }
    
    fileprivate func configureUI() {
        viewModel.fetchMovie(movieId: viewModel.movieDetails[0].movieId) {
            DispatchQueue.main.async { [self] in
                let base = "https://image.tmdb.org/t/p/original/"
                let data = self.viewModel.movies[0]
                let image = base + data.backdropPath
                movieImage.sd_setImage(with: image.asUrl)
                let remaining: TimeInterval = TimeInterval(data.runtime * 60)
                if let result = formatter.string(from: remaining) {
                    runTime.text = result
                }
                movieTitle.text = data.title
                var count = 0
                for genre in data.genres {
                    count += 1
                    if count < data.genres.count{
                        self.genre.text! += "\(genre.name),"
                    } else {
                        self.genre.text! += genre.name
                    }
                    
                }
                releaseDate.text = data.releaseDate
                country.text = data.productionCountries[0].name
                tagLine.text = data.tagline
                let fullStar = UIImage(systemName: "star.fill")
                
                let halfStar = UIImage(systemName: "star.leadinghalf.fill")
                
                let number = data.voteAverage
                
                let starRatings = Int(number / 10)
                
                switch starRatings {
                
                case 1:
                    
                    DispatchQueue.main.async { [self] in
                        self.firstStar.image = halfStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                    }
                    
                    
                case 2:
                    
                    DispatchQueue.main.async { [self] in
                        firstStar.image = fullStar
                        firstStar.tintColor = #colorLiteral(red: 1, green: 0.9782602489, blue: 0.6465145808, alpha: 1)
                    }
                    
                case 3:
                    
                    DispatchQueue.main.async { [self] in
                        firstStar.image = fullStar
                        secondStar.image = halfStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                    }
                    
                case 4:
                    
                    DispatchQueue.main.async { [self] in
                        firstStar.image = fullStar
                        secondStar.image = fullStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        
                    }
                    
                case 5:
                    
                    DispatchQueue.main.async { [self] in
                        firstStar.image = fullStar
                        secondStar.image = fullStar
                        thirdStar.image = halfStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        thirdStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        
                    }
                    
                case 6:
                    
                    DispatchQueue.main.async { [self] in
                        
                        firstStar.image = fullStar
                        secondStar.image = fullStar
                        thirdStar.image = fullStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        thirdStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        
                    }
                    
                case 7:
                    
                    DispatchQueue.main.async { [self] in
                        
                        firstStar.image = fullStar
                        secondStar.image = fullStar
                        thirdStar.image = fullStar
                        fourthStar.image = halfStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        thirdStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        fourthStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        
                    }
                    
                case 8:
                    
                    DispatchQueue.main.async { [self] in
                        
                        firstStar.image = fullStar
                        secondStar.image = fullStar
                        thirdStar.image = fullStar
                        fourthStar.image = fullStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        thirdStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        fourthStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        
                    }
                    
                case 9:
                    
                    DispatchQueue.main.async { [self] in
                        
                        firstStar.image = fullStar
                        secondStar.image = fullStar
                        thirdStar.image = fullStar
                        fourthStar.image = fullStar
                        fifthStar.image = halfStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        thirdStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        fourthStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        fifthStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        
                    }
                    
                case 10:
                    
                    DispatchQueue.main.async { [self] in
                        
                        firstStar.image = fullStar
                        secondStar.image = fullStar
                        thirdStar.image = fullStar
                        fourthStar.image = fullStar
                        fifthStar.image = fullStar
                        firstStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        secondStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        thirdStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        fourthStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        fifthStar.tintColor = #colorLiteral(red: 0.9699534774, green: 0.9455825686, blue: 0.6218637824, alpha: 1)
                        
                    }
                    
                default:
                    
                    break
                    
                }
                
                
                
            }
            
            
            
        }
    }
    

    }
    
