//
//  Movies.swift
//  TicketStore
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/02/20.
//  Copyright © 2020 Nina Dominique Thomé Bernardo - NBE. All rights reserved.
//

import Foundation

struct Movies: Codable {
    let id: Int
    let title: String
    let photo: String
    let category: String
    let plot: String
    let director: String
    let writer: String
    let yearOfCreation: Int
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case photo
        case category
        case plot
        case director
        case writer
        case yearOfCreation
        //        case complemento
    }
}




