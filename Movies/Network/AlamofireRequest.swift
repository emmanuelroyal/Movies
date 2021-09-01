//
//  AlamofireRequest.swift
//  Movies
//
//  Created by Decagon on 8/31/21.
//

import Foundation
import Alamofire


struct NetworkService {
    
    fileprivate var baseURL = "https://api.themoviedb.org/3/movie/"
    
    func fetchMovies(endPoint: String,
                     completion: @escaping (AFDataResponse<Any>) -> Void) {
        
        AF.request(baseURL + endPoint, parameters: nil, headers: nil ).validate(statusCode: 200 ..< 299).responseJSON(completionHandler: completion)
    }

}

