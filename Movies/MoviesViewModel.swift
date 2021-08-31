//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Decagon on 8/30/21.
//

import UIKit
import Alamofire

class MoviesViewModel {
    
    var popularMovies:[MoviesModel] = []
    private var service = NetworkService()
    var movies:[Movie] = []
    
    func fetchPopularmovies(completion: @escaping () -> Void) {
        
        service.fetchMovies(endPoint: "popular?api_key=d45944547cfa0d9a8c565045b166e51b&language=en-US&page=1") { response in
            
            guard let response = response.data else { return }
            
            do {
                
                let popularMovies =  try JSONDecoder().decode(MoviesModel.self, from: response)
                self.popularMovies.append(popularMovies)
                completion()
                
            } catch {
                
                debugPrint(error.localizedDescription)
                
            }
            
        }
        
    }
    
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
    
}
