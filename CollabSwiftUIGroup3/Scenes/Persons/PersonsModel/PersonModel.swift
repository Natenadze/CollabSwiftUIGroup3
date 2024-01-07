//
//  PersonModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 05.01.24.
//

import Foundation

struct ApiResponse: Decodable {
    let results: [Person]
}

struct Person: Decodable, Identifiable {
    let id: Int
    let name: String
    let originalName: String
    let profilePath: String
    let knownFor: [Work]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case originalName = "original_name"
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

