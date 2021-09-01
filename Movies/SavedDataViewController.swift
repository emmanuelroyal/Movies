//
//  SavedDataViewController.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import UIKit

class SavedDataViewController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    
    var viewModel = SavedDataViewModel()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
         count += 1
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        count += 1
        if count >= 3 {
            
        collection.reloadData()
        
        }
    }
    
}
   

extension SavedDataViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        viewModel.data.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as?
                SavedDataCollectionViewCell else {
            
            return UICollectionViewCell()
            
        }
        
        cell.setup(with: viewModel.data[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width/2.1,
                      height: collectionView.frame.height/2.45)
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? MoviesCollectionViewCell
        cell?.contentView.backgroundColor = .systemGray
        collection.deselectItem(at: indexPath, animated: true)
        let movieData = viewModel.data[indexPath.row]
        
        guard let newViewController = storyboard?.instantiateViewController(identifier: "SavedDetailStoryBoard") as?  SavedDetailsViewController   else { return }
        
        newViewController.viewModel.MovieDetails.append(movieData)
        print(movieData)
        navigationController?.pushViewController(newViewController, animated: true)
        
    }
}


