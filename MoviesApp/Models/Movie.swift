//
//  Movie.swift
//  MoviesApp
//
//  Created by Imanol Ortiz on 24/6/22.
//

import Foundation

struct Response: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct Movie: Decodable {
    
    let title: String
    let overview: String
    let rating: Double
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case overview
        case rating = "vote_average"
        case imageUrl = "poster_path"
    }
}
