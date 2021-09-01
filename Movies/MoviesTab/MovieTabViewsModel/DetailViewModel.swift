//
//  DetailViewModel.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import Foundation
import SwiftyJSON

class DetailViewModel {
    
    var movieDetails: [EditedMovieModel] = []
    var movies:[Movie] = []
    private var service = NetworkService()
    
    func fetchMovie(movieId: Int, completion: @escaping () -> Void) {
        
        self.movies.removeAll()
        
        service.fetchMovies(endPoint: "\(movieId)?api_key=d45944547cfa0d9a8c565045b166e51b&language=en-US") { response in
            guard let response = response.data else { return }
            
            var rating = 0.0
            var genre1 = ""
            var genre2 = ""
            var genre3 = ""
            var genre4 = ""
            var runtime = 0.0
            var tagline = ""
            var title = ""
            var productionCountrys = ""
            var releaseDate = ""
            var overview = ""
            
                let json =  JSON(response)
            if let rate = json["vote_average"].double {
                rating = rate
            }
            if let genreOne = json["genres"][0]["name"].string {
                
            genre1 = "\(genreOne),"
                
            }
                
            if let genreTwo = json["genres"][1]["name"].string {
                genre2 = "\(genreTwo),"
            }
            
            if let genreThree = json["genres"][2]["name"].string {
                genre3 = "\(genreThree),"
            }
            if let genreFour = json["genres"][3]["name"].string {
                genre4 = "\(genreFour),"
            }
            
            if let run = json["runtime"].double {
                runtime = run
            }
            
            if let tag = json["tagline"].string {
                tagline = tag
            }
            
            if let titles = json["title"].string {
                title = titles
            }
            
            if let productionCountry = json["production_countries"][0]["name"].string {
                productionCountrys = productionCountry
            }
            
            if let release = json["release_date"].string {
                releaseDate  = release
            }
            
            
            if let overviews = json["overview"].string {
                overview = overviews
            }
                
                let movie = Movie(genres: "\(genre1) \(genre2) \(genre3) \(genre4) ", overview: overview, production_countries: productionCountrys, release_date: releaseDate, runtime: Int(runtime), tagline: tagline, title: title, vote_average: Int(rating))
                self.movies.append(movie)
                completion()
            
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
