//
//  MovieMockData.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct MovieMockData {
    @State var path = NavigationPath()
    
    static let previewExample = Movie(
        id: 1,
        overview: "Test Description",
        posterPath: "placeholder",
        releaseDate: "12-09",
        title: "Test Title",
        voteAverage: 9.5)
}



