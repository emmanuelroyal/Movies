//
//  MoviesModel.swift
//  Movies
//
//  Created by Decagon on 8/30/21.
//

import UIKit
import RealmSwift

struct MoviesModel : Codable {
    
    let results : [ResultsModel]?
    let page : Int?
    let total_results : Int?
    let total_pages : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case results = "results"
        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([ResultsModel].self, forKey: .results)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
    }
    
}


struct ResultsModel : Codable, Equatable {
    
    let video : Bool?
    let vote_average : Double?
    let popularity : Double?
    let vote_count : Int?
    let release_date : String?
    let adult : Bool?
    let backdrop_path : String?
    let overview : String?
    let genre_ids : [Int]?
    let title : String?
    let original_language : String?
    let original_title : String?
    let poster_path : String?
    let id : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case video = "video"
        case vote_average = "vote_average"
        case popularity = "popularity"
        case vote_count = "vote_count"
        case release_date = "release_date"
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case overview = "overview"
        case genre_ids = "genre_ids"
        case title = "title"
        case original_language = "original_language"
        case original_title = "original_title"
        case poster_path = "poster_path"
        case id = "id"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
    }
    
    static func == (lhs: ResultsModel, rhs: ResultsModel) -> Bool {
        return lhs.video == rhs.video &&
            lhs.vote_average == rhs.vote_average &&
            lhs.popularity == rhs.popularity &&
            lhs.vote_count == rhs.vote_count &&
            lhs.release_date == rhs.release_date &&
            lhs.adult == rhs.adult &&
            lhs.backdrop_path == rhs.backdrop_path &&
            lhs.overview == rhs.overview &&
            lhs.genre_ids == rhs.genre_ids &&
            lhs.title == rhs.title &&
            lhs.original_language == rhs.original_language &&
            lhs.original_title == rhs.original_title &&
            lhs.poster_path == rhs.poster_path &&
            lhs.id == rhs.id
    }
    
}


struct Movie: Decodable {
    let genres: String?
    let overview: String?
    let production_countries: String?
    let release_date: String?
    let  runtime: Int?
    let tagline, title: String?
    let vote_average: Int?
    
}


class SavedMovieModel: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var image: NSData!
    @objc dynamic var runTime = ""
    @objc dynamic var genre = ""
    @objc dynamic var releaseDate = ""
    @objc dynamic var country = ""
    @objc dynamic var tagLine = ""
    @objc dynamic var rating = ""
    @objc dynamic var overview = ""
    @objc dynamic var liked: Bool = false
    
}

class EditedMovieModel {
    
    var name, runTime, genre, releaseDate, country, tagLine, image : String!
    var liked: Bool
    var movieId: Int
    var rating : Double
    
    internal init(name: String? = nil,
                  runTime: String? = nil, genre: String? = nil,
                  releaseDate: String? = nil, country: String? = nil,
                  tagLine: String? = nil, image: String? = nil, rating: Double,
                  liked: Bool, movieId: Int) {
        
        self.name = name
        self.runTime = runTime
        self.genre = genre
        self.releaseDate = releaseDate
        self.country = country
        self.tagLine = tagLine
        self.image = image
        self.rating = rating
        self.liked = liked
        self.movieId = movieId
    }
    
}
