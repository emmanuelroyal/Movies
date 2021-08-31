//
//  MoviesViewModel.swift
//  Movies
//
//  Created by Decagon on 8/30/21.
//

import UIKit
import Alamofire
import RealmSwift

class MoviesViewModel {
    
    var popularMovies: [EditedMovieModel] = []
    private var service = NetworkService()
    var ApiData: [MoviesModel] = []
    var itemNames:[String] = []
    var completion: (() -> Void)?
    var data: [SavedMovieModel] {realm.objects(SavedMovieModel.self).map({ $0 })}
    
    let realm = try! Realm()
    
    func fetchPopularmovies(completion: @escaping () -> Void) {
        
        service.fetchMovies(endPoint: "popular?api_key=d45944547cfa0d9a8c565045b166e51b&language=en-US&page=1") { response in
            
            guard let response = response.data else { return }
            
            do {
                
                let popularMovies =  try JSONDecoder().decode(MoviesModel.self, from: response)
                self.ApiData.append(popularMovies)
                completion()
                
            } catch {
                
                debugPrint(error.localizedDescription)
                
            }
            
        }
        
    }
    
    func get() {
        
        self.popularMovies.removeAll()
        let realmData = data
        let base = "https://image.tmdb.org/t/p/original/"
        for movie in self.ApiData {
            
            for movies in realmData {
                
                self.itemNames.append(movies.name)
                
            }
            if self.itemNames.contains(movie.results[0].originalTitle) {
                
                let image = base + movie.results[0].backdropPath
                self.popularMovies.append(EditedMovieModel(name: movie.results[0].title, runTime: " ", genre: " ", releaseDate: movie.results[0].releaseDate, country: " " , tagLine: " ", image: image, liked: true, movieId: movie.results[0].id))
                
            } else {
                let image = base + movie.results[0].backdropPath
                self.popularMovies.append(EditedMovieModel(name: movie.results[0].title, runTime: " ", genre: " ", releaseDate: movie.results[0].releaseDate, country: " " , tagLine: " ", image: image, liked: false, movieId: movie.results[0].id))
            }
            
        }
        
        completion?()
    }
    
}
