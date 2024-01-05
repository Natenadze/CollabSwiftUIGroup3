//
//  TVSeriesReviewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import Foundation

struct ReviewsResponse: Codable {
    let id: Int
    let results: [Review]
}

struct Review: Codable {
    let author: String
    let authorDetails: AuthorDetails
    let content: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case url
    }
}

struct AuthorDetails: Codable {
    let name, username: String
    let avatarPath: String?
    let rating: Int
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}
