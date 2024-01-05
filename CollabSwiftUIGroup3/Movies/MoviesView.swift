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
    
    var body: some View {
        NavigationStack {
            List(viewModel.allMovies, id: \.id) { movie in
                HStack(spacing: 16) {
                    posterView(movie: movie)
                    infoStack(movie: movie)
                }
                .listRowBackground(backgroundColor)
            }
            .background(backgroundColor)
            .scrollContentBackground(.hidden)
            .listStyle(GroupedListStyle())
            .navigationTitle("Popular Movies")
            .preferredColorScheme(.dark)
        }
    }
    
    // MARK: - Subviews
    private func posterView(movie: Movie) -> some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { phase in
            switch phase {
            case .success(let image):
                image.resizable()
                    .frame(width: 120, height: 140)
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            case .empty:
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.6))
                    .frame(width: 120, height: 140)
            case .failure(_):
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 120, height: 140)
            @unknown default:
                EmptyView()
            }
        }
    }
    
    private func infoStack(movie: Movie) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            movieTitleView(movie: movie)
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 10) {
                    ratingStarView()
                    voteAverageView(movie: movie)
                    movieReleaseDateView(movie: movie)
                }
            }
        }
    }
    
    private func movieTitleView(movie: Movie) -> some View {
        Text(movie.title)
            .font(.system(size: 18, weight: .bold))
            .foregroundStyle(.white)
    }
    
    private func ratingStarView() -> some View {
        Image(systemName: "star.fill")
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
    }
    
    private func voteAverageView(movie: Movie) -> some View {
        Text("\(movie.voteAverage, specifier: "%.1f")")
            .font(.system(size: 16))
            .foregroundStyle(.white)
    }
    
    private func movieReleaseDateView(movie: Movie) -> some View {
        Text("\(movie.releaseDate)")
            .font(.subheadline)
            .font(.system(size: 14))
            .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    MoviesView()
}
