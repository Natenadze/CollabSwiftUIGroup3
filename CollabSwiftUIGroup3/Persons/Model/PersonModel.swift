//
//  PersonModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 05.01.24.
//

import Foundation

struct ApiResponse: Decodable {
    let results: [Person]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Person: Decodable, Identifiable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String
    let knownFor: [Work]
    
    enum CodingKeys: String, CodingKey {
        case adult
        case gender
        case id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

struct Work: Decodable {
    let title: String?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
    }
}

