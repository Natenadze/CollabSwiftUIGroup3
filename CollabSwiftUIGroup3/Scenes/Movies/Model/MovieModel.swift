//
//  MovieModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import Foundation

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable, Hashable {
    let id: Int
    let overview: String
    let posterPath, releaseDate, title: String
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

