//
//  MovieDetailsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct MovieDetailsView: View {
    
    // MARK: - Properties
    let movie: Movies
    
    
    // MARK: - Body
    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500" + movie.posterPath)) { image in
            image
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }

        
        Text(movie.title)
        Text(movie.releaseDate)
        Text("vote average: \(movie.voteAverage)")
    }
}


// MARK: - Preview
#Preview {
    let movie = Movies(backdropPath: "a", id: 2, overview: "", posterPath: "https://image.tmdb.org/t/p/w500/sRLC052ieEzkQs9dEtPMfFxYkej.jpg", releaseDate: "", title: "movie title 1", voteAverage: 12, voteCount: 1)
    
    return MovieDetailsView(movie: movie)
}
