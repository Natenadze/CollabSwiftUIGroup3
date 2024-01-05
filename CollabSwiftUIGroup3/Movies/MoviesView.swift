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
    @State var path = NavigationPath()
    
    private let backgroundColor = Color(red: 18/255, green: 18/255, blue: 18/255)
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            List(viewModel.allMovies, id: \.id) { movie in
                NavigationLink(value: movie) {
                    rowContentView(movie: movie)
                }
                .listRowBackground(backgroundColor)
            }
            .navigationDestination(for: Movie.self) { movie in
                MovieDetailsView(viewModel: MovieDetailsViewModel(movie: movie, path: $path))
            }
            .background(backgroundColor)
            .scrollContentBackground(.hidden)
            .listStyle(GroupedListStyle())
            .navigationTitle("Popular Movies")
            .preferredColorScheme(.dark)
        }
    }
    
    // MARK: - Content
    private func rowContentView(movie: Movie) -> some View {
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
    private func infoStack(movie: Movie) -> some View {
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
    
    private func movieTitleView(movie: Movie) -> some View {
        Text(movie.title)
            .font(.system(size: 16, weight: .bold))
            .foregroundStyle(.white)
    }
  
    private func movieReleaseDateView(movie: Movie) -> some View {
        Text("\(movie.releaseDate)")
            .font(.system(size: 14))
            .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    MoviesView()
}
