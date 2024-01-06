//
//  TVSeriesReviewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import Foundation

struct ReviewsResponse: Decodable {
    let id: Int
    let results: [Review]
}

struct Review: Decodable {
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

struct AuthorDetails: Decodable {
    let name, username: String
    let avatarPath: String?
    let rating: Int
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}
