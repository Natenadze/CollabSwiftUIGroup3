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
                        NavigationLink(value: movie) {
                            CinemaMovieGridView(movie: movie)
                        }
                    }
                }
                .navigationTitle("Now in Cinemas")
                .navigationDestination(for: AppMovie.self) { movie in
                    CinemaMovieReviewsView(viewModel: CinemaMovieReviewViewModel(movieID: movie.id))
                }
                
        }
    }
}


// MARK: - Preview
#Preview {
    CinemaMoviesView()
}
