//
//  AppModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import Foundation

struct AppMoviesResponse: Decodable {
    let results: [AppMovie]
}

struct AppMovie: Decodable, Identifiable, Hashable {
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
