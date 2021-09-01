//
//  DetailViewModel.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import Foundation
import RealmSwift

class SavedDetailViewModel{
    var MovieDetails: [SavedMovieModel] = []
    
    let realm = try! Realm()

    
    func delete(item: SavedMovieModel){
        
        let data = realm.objects(SavedMovieModel.self).map({ $0 })
        
        for i in data {
            
            if i.image == item.image {
                
                RealmService.shared.delete(i)
                
            }
            
        }
        
    }
    
    
}

