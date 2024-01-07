//
//  CinemaMovieGridView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

struct CinemaMovieGridView: View {
    // MARK: - Properties
    private let movie: AppMovie
    
    // MARK: - Init
    init(movie: AppMovie) {
        self.movie = movie
    }
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            ImageManager(imageUrl: ApiManager.imageBaseUrl + movie.posterPath)
            
            Text(movie.title)
                .frame(alignment: .leading)
                .foregroundStyle(.white)
                .lineLimit(2)
            
            AppCinemaRatingBarView(selected: movie.voteAverage)
            
            Spacer()
        }
    }
}
