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
                   completion: @escaping (AFDataResponse<Data?>) -> Void) {
        
        AF.request(self.baseURL + endPoint,
                   method: .get, parameters: nil,
                   encoding: URLEncoding.default, headers: nil,
                   interceptor: nil).response(completionHandler: completion)
    
    }

}

