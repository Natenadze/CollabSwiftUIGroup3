//
//  CinemaMoviesView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct CinemaMoviesView: View {
    // MARK: - Properties
    @StateObject private var viewModel = CinemaMoviesViewModel()
    private let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 250), spacing: 20)
    ]
    
    // MARK: - Body
    var body: some View {
        if viewModel.allCinemaMovies.isEmpty {
            ProgressView()
        }else {
            NavigationStack {
                ZStack {
                    Color.appBackgroundColor.ignoresSafeArea()
                    
                    mainGridContent
                }
            }
        }
    }
}

// MARK: - Extensions
private extension CinemaMoviesView {
    
    var mainGridContent: some View {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.allCinemaMovies) { movie in
                        let model = GridInfoModel(
                            id: movie.id,
                            name: movie.title,
                            rating: movie.voteAverage,
                            posterUrl: movie.posterPath,
                            date: movie.releaseDate
                        )
                        
                        NavigationLink(value: model) {
                            AppGridView(series: model)
                        }
                    }
                }
                .navigationTitle("Now in Cinemas")
                .navigationDestination(for: GridInfoModel.self) { movie in
                    CinemaMovieReviewsView(viewModel: CinemaMovieReviewViewModel(movieID: movie.id))
                }
                
        }
    }
}


// MARK: - Preview
#Preview {
    CinemaMoviesView()
}
