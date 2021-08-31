//
//  MoviesModel.swift
//  Movies
//
//  Created by Decagon on 8/30/21.
//

import UIKit
import RealmSwift

struct MoviesModel: Decodable {
    let page: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable {
    let backdropPath: String
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let voteAverage, voteCount: Int
}

struct Movie: Decodable {
    let backdropPath: String
    let genres: [Genre]
    let imdbID, originalLanguage, originalTitle, overview: String
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let voteAverage, voteCount: Int
}

// MARK: - Genre
struct Genre: Decodable {
    let id: Int
    let name: String
}

// MARK: - ProductionCountry
struct ProductionCountry: Decodable {
    let iso3166_1, name: String
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Decodable {
    let englishName, iso639_1, name: String
}

class SavedMovieModel: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var image: UIImage!
    @objc dynamic var runTime = ""
    @objc dynamic var genre = ""
    @objc dynamic var releaseDate = ""
    @objc dynamic var country = ""
    @objc dynamic var tagLine = ""
    @objc dynamic var liked: Bool = false
    
}

