//
//  MoviesService.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation
import Alamofire

protocol MoviesServiceContract {
    func get(id: Int, completionHandler: @escaping (Result<Movies,MoviesServiceError>) -> Void)
    func list(completionHandler: @escaping (Result<[Movies],MoviesServiceError>) -> Void)
}
enum MoviesServiceError: Error {
    case error
}
class MoviesService: MoviesServiceContract {
    let baseUrl: String = "https://ticketstore-1581086817350.azurewebsites.net"
    
    func list(completionHandler: @escaping (Result<[Movies],MoviesServiceError>) -> Void) {
        AF.request("\(baseUrl)/movies").response { (res) in
            guard let data = res.data, let list = try? JSONDecoder().decode([Movies].self, from: data) else {
                completionHandler(Result.failure(MoviesServiceError.error))
                return
            }
            
            completionHandler(Result.success(list))
            return
        }
    }
    
    func get(id: Int, completionHandler: @escaping (Result<Movies,MoviesServiceError>) -> Void) {
        AF.request("\(baseUrl)/movies/\(id)").response { (res) in
            guard let data = res.data, let movie = try? JSONDecoder().decode(Movies.self, from: data) else {
                completionHandler(Result.failure(MoviesServiceError.error))
                return
            }
            
            completionHandler(Result.success(movie))
            return
        }
    }
}
