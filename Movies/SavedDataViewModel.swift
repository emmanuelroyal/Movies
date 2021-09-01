//
//  SavedDataViewModel.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import Foundation
import RealmSwift

class SavedDataViewModel {
    
    let realm = try! Realm()
    var data: [SavedMovieModel] {realm.objects(SavedMovieModel.self).map({ $0 })}
    
}
