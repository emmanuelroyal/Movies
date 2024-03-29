//
//  SavedDataCollectionViewCell.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import UIKit

class SavedDataCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var firstStar: UIImageView!
    @IBOutlet weak var secondStar: UIImageView!
    @IBOutlet weak var thirdStar: UIImageView!
    @IBOutlet weak var fourthStar: UIImageView!
    @IBOutlet weak var fifthStar: UIImageView!
    
    func setup(with data: SavedMovieModel){
        
        movieImage.image = UIImage(data: data.image as Data)
        movieTitle.text = data.name
        releaseDate.text = data.releaseDate
        
        let fullStar = UIImage(systemName: "star.fill")
        
        let halfStar = UIImage(systemName: "star.leadinghalf.fill")
        
        let number = Int(data.rating)
        
        switch number {
        
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

