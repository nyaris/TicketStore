//
//  DetailsMoviesViewModel.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 07/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

protocol DetailsMoviesViewModelDelegate: class {
  
}

class DetailsMoviesViewModel {
    
    var movies: [Movies] = []
    weak var delegate: DetailsMoviesViewModelDelegate?
    
    
    var movie: Movies
    
    init(movie: Movies) {
        self.movie = movie
    }
    
    }
    

