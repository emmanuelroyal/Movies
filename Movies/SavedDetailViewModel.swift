//
//  DetailViewModel.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import Foundation
import RealmSwift

class SavedDetailViewModel{
    var movies:[Movie] = []
    private var service = NetworkService()
    var data: [SavedMovieModel] {realm.objects(SavedMovieModel.self).map({ $0 })}
    let realm = try! Realm()
    
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
    
    func delete(item: SavedMovieModel){
        let data = realm.objects(SavedMovieModel.self).map({ $0 })
        
        for i in data {
            
            if i.image == item.image {
                
                RealmService.shared.delete(i)
                
            }
            
        }
        
    }
    
    
}

