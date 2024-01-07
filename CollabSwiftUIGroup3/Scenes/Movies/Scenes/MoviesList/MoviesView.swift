//
//  MoviesView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct MoviesView: View {
    // MARK: - Properties
    @StateObject private var viewModel = MoviesViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List(viewModel.allMovies) { movie in
                NavigationLink(value: movie) {
                    rowContentView(movie: movie)
                }
                .listRowBackground(Color.appBackgroundColor)
            }
            .background(Color.appBackgroundColor)
            .scrollContentBackground(.hidden)
            .listStyle(GroupedListStyle())
            .navigationTitle("Popular Movies")
            .preferredColorScheme(.dark)
            .navigationDestination(for: AppMovie.self) { movie in
                MovieDetailsView(viewModel: MovieDetailsViewModel(movie: movie))
            }
        }
    }
    
    // MARK: - Content
    private func rowContentView(movie: AppMovie) -> some View {
        HStack(spacing: 16) {
            PosterView(movie: movie,
                       posterPath: movie.posterPath,
                       frameWidth: 120,
                       frameHeight: 140,
                       cornerRadius: 12)
            infoStack(movie: movie)
        }
    }
    
    // MARK: - InfoStack
    private func infoStack(movie: AppMovie) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            movieTitleView(movie: movie)
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 10) {
                    RatingStarView(frameWidth: 20, frameHeight: 20)
                    VoteAverageView(movie: movie, font: .system(size: 16))
                }
                movieReleaseDateView(movie: movie)
            }
        }
    }
    
    private func movieTitleView(movie: AppMovie) -> some View {
        Text(movie.title)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(.white)
    }
    
    private func movieReleaseDateView(movie: AppMovie) -> some View {
        Text("\(movie.releaseDate)")
            .font(.system(size: 14))
            .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    MoviesView()
}
