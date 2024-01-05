//
//  MovieDetailsViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

final class MovieDetailsViewModel: ObservableObject {
    // MARK: - Properties
    let movie: Movie
    @Binding var path: NavigationPath
    
    var posterPath: String {
        movie.posterPath
    }
    
    var title: String {
        movie.title
    }
    
    var overview: String {
        movie.overview
    }
    
    var releaseDate: String {
        movie.releaseDate
    }
    
    var voteAverage: Double {
        movie.voteAverage
    }
    
    // MARK: - Init
    init(movie: Movie, path: Binding<NavigationPath>) {
        self.movie = movie
        self._path = path
    }
}
