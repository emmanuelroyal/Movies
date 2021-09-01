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

            guard let responses = response.data else { return }
            print(responses)
            do {

                let popularMovies =  try JSONDecoder().decode(MoviesModel.self, from: responses)
                print(popularMovies)
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
        for movie in self.ApiData[0].results! {
            print(movie, " now" )
            
            for movies in realmData {
                
                self.itemNames.append(movies.name)
                
            }
            if self.itemNames.contains((movie.title)!) {
                
                let image = base + movie.backdrop_path!
                self.popularMovies.append(EditedMovieModel(name: movie.title, runTime: "", genre: "", releaseDate: movie.release_date, country: "", tagLine: "", image: image, rating: movie.vote_average!, liked: true, movieId: movie.id!))
                
            } else {
                let image = base + movie.backdrop_path!
                self.popularMovies.append(EditedMovieModel(name: movie.title, runTime: "", genre: "", releaseDate: movie.release_date, country: "", tagLine: "", image: image, rating: movie.vote_average!, liked: false, movieId: movie.id!))
            }
            
        }
        
        completion?()
    }
    
}
