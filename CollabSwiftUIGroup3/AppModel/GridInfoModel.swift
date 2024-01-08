//
//  GridInfoModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 08.01.24.
//

import Foundation

struct GridInfoModel: GridInfoProtocol, Hashable {
    var id: Int
    var name: String
    var rating: Double
    var posterUrl: String
    var date: String
}
