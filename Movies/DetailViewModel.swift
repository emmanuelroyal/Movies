//
//  DetailViewModel.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import Foundation

class DetailViewModel {
    
    var movieDetails: [EditedMovieModel] = []
    var movies:[Movie] = []
    private var service = NetworkService()
    
    func fetchMovie(movieId: Int, completion: @escaping () -> Void) {
        
        self.movies.removeAll()
        
        service.fetchMovies(endPoint: "\(movieId)?api_key=d45944547cfa0d9a8c565045b166e51b&language=en-US") { response in
            
            guard let response = response.data else { return }
            
            do {
                
                let movie =  try JSONDecoder().decode(Movie.self, from: response)
                self.movies.append(movie)
                completion()
                
            } catch {
                
                print(error.localizedDescription)
                
            }
            
        }
        
    }
    
    func create(item: SavedMovieModel){
        
        let savedMovie = SavedMovieModel()
        savedMovie.name = item.name
        savedMovie.genre = item.genre
        savedMovie.image = item.image
        savedMovie.country = item.country
        savedMovie.runTime = item.runTime
        savedMovie.liked = item.liked
        RealmService.shared.create(savedMovie)
    
    }

    
}
