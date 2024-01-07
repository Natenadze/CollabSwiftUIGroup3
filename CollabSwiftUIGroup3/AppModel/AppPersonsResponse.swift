//
//  AppPersonsResponse.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import Foundation

struct AppPersonsResponse: Decodable {
    let results: [AppPerson]
}

struct AppPerson: Decodable, Identifiable {
    let id: Int
    let name: String
    let originalName: String
    let profilePath: String
    let knownFor: [AppWork]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case originalName = "original_name"
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

struct AppWork: Decodable {
    let title: String?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case posterPath = "poster_path"
    }
}
