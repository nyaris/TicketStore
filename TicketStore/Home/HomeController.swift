//
//  HomeController.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

protocol MoviesViewModelContract {
    var movies: [Movies] { get }
    func fetchMovies()
    func set(delegate: MoviesViewModelViewDelegate?)
}

protocol HomeControllerDelegate: class {
  
    func didSelectItem(_ movies: Movies)
}

protocol MoviesViewModelViewDelegate: class {
    
    func didUpdateMoviesList()
    func didCompleteWithError(_ message: String)
}

class HomeController: MoviesViewModelContract {
    private var moviesList: [Movies] = []
    
    var movies: [Movies] {
        return moviesList
    }

//  MARK: - Variables
    var service: MoviesService?
    
//  MARK: - Delegates
    weak var delegate: MoviesViewModelViewDelegate?
    weak var delegateHome: HomeControllerDelegate?
    
//  MARK: - Methods
    init(delegate: MoviesViewModelViewDelegate?, service: MoviesService?) {
        self.delegate = delegate
        self.service = service ?? MoviesService()
    }
    
    func set(delegate: MoviesViewModelViewDelegate?) {
        self.delegate = delegate
    }
    
    func set(delegateHome: HomeControllerDelegate?) {
        self.delegateHome = delegateHome
    }
    
    func fetchMovies() {
        service?.list(completionHandler: { (result) in
            guard let list = try? result.get() else {
                self.delegate?.didCompleteWithError("Ocorreu um erro ao recuperar a lista de usuários")
                return
            }
            
            self.moviesList.removeAll()
            self.moviesList.append(contentsOf: list)
            self.delegate?.didUpdateMoviesList()
        })
    }
    
    func showDetails(index: IndexPath) {
       
           let movie = movies[index.row]
           delegateHome?.didSelectItem(movie)
       }
}
