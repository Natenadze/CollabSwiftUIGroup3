//
//  AppReviewsModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import Foundation

struct AppReviewsResponse: Decodable {
    let results: [AppReview]
}

struct AppReview: Decodable {
    let author: String
    let authorDetails: AppAuthorDetails
    let content: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case author
        case authorDetails = "author_details"
        case content
        case url
    }
}

struct AppAuthorDetails: Decodable {
    let name, username: String
    let avatarPath: String?
    let rating: Int
    
    enum CodingKeys: String, CodingKey {
        case name, username
        case avatarPath = "avatar_path"
        case rating
    }
}
