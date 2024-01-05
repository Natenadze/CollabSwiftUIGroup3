//
//  CinemaModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import Foundation

struct CinemaModel: Decodable {
    let results: [Movies]
}

// MARK: - Result
struct Movies: Decodable, Identifiable, Hashable {
    let backdropPath: String
    let id: Int
    let overview: String
    let posterPath, releaseDate, title: String
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
