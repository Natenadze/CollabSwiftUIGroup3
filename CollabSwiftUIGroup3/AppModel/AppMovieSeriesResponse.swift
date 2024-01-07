//
//  AppMovieSeriesResponse.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import Foundation

struct AppMovieSeriesResponse: Decodable {
    let results: [AppTVSeriesOnAir]
}

struct AppTVSeriesOnAir: Decodable, Hashable, Identifiable {
    let id: Int
    let overview: String
    let posterPath, firstAirDate, name: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case firstAirDate = "first_air_date"
        case name
        case voteAverage = "vote_average"
    }
}

