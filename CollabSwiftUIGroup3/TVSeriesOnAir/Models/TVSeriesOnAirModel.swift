//
//  TVSeriesOnAirModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import Foundation

struct TVSeriesOnAirResponse: Codable {
    let results: [TVSeriesOnAir]
}

struct TVSeriesOnAir: Codable, Hashable {
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

