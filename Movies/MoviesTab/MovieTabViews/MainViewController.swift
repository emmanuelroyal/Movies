//
//  ViewController.swift
//  Movies
//
//  Created by Decagon on 8/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collection: UICollectionView!
    var viewModel = MoviesViewModel()
    var isLoading = false
    var page = 1
    var count = 1
    var data:Int { viewModel.apiData.count * 20 }
    var gesture = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMediaListeners()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collection.reloadData()
        if count > 1 {
            viewModel.get(page: page - 1)
            setupMediaListeners()
            count += 1
        }
        
    }
    
    fileprivate func setupMediaListeners() {
        
        viewModel.fetchPopularmovies(page: page) {
            
            self.viewModel.get(page: self.page - 1)
            
        }
        
        viewModel.completion = { [weak self] in
            
            DispatchQueue.main.async {
                self?.collection.reloadData()
            }
            
        }
        
    }
    
}

extension ViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.popularMovies.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as?
                MoviesCollectionViewCell else {
            
            return UICollectionViewCell()
            
        }
        
        cell.setup(with: viewModel.popularMovies[indexPath.row])
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
        let movieData = viewModel.popularMovies[indexPath.row]
        let details = EditedMovieModel(name: movieData.name, runTime: "", genre: "", releaseDate: movieData.releaseDate, country: "", tagLine: "", image: movieData.image, rating: movieData.rating, liked: movieData.liked, movieId: movieData.movieId)
        
        guard let newViewController = storyboard?.instantiateViewController(identifier: "DetailStoryBoard") as?  DetailViewController   else { return }
        
        newViewController.viewModel.movieDetails.removeAll()
        newViewController.viewModel.movieDetails.append(details)
        navigationController?.pushViewController(newViewController, animated: true)
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        
        
        
        if indexPath.row == viewModel.popularMovies.count / 2 && collection.scrollDirection == .up && viewModel.isLoading == true {
            page += 1
            viewModel.fetchPopularmovies(page: page) { [self] in
                self.viewModel.get(page: page - 1)
                viewModel.completion  = { [weak self] in
                    DispatchQueue.main.async {
                        self?.collection.reloadData()
                    }
                    
                }
            }
        }
    }
    
}


