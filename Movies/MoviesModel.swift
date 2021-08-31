//
//  MoviesModel.swift
//  Movies
//
//  Created by Decagon on 8/30/21.
//

import UIKit

struct MoviesModel {
    let page: Int
    let results: [Result]
}

// MARK: - Result
struct Result {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage, voteCount: Int
}

struct Movie {
    let adult: Bool
    let backdropPath: String
    let belongsToCollection: BelongsToCollection
    let budget: Int
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdbID, originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath: String
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String
    let revenue, runtime: Int
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String
    let video: Bool
    let voteAverage, voteCount: Int
}

// MARK: - BelongsToCollection
struct BelongsToCollection {
    let id: Int
    let name, posterPath, backdropPath: String
}

// MARK: - Genre
struct Genre {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
struct ProductionCompany {
    let id: Int
    let logoPath: String?
    let name, originCountry: String
}

// MARK: - ProductionCountry
struct ProductionCountry {
    let iso3166_1, name: String
}

// MARK: - SpokenLanguage
struct SpokenLanguage {
    let englishName, iso639_1, name: String
}


