//
//  MovieGridView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct MovieGridView: View {
    
    // MARK: - Properties
    
    let movie: Movies
    
    // MARK: - Init
    init(movie: Movies) {
        self.movie = movie
    }
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + movie.posterPath), content: { image in
                image
                    .resizable()
                    .scaledToFit()
            }) {
                ProgressView()
            }
            .frame(width: 150, height: 200)
            
            
            Text(movie.title)
                .frame(alignment: .leading)
                .foregroundStyle(.white)
                .lineLimit(2)
            RatingBarView(selected: movie.voteAverage)
        }
    }
}
