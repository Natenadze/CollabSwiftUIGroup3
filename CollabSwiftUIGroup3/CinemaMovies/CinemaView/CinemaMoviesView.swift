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
    
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 250), spacing: 20)
    ]
    
    // MARK: - Body
    var body: some View {
        if viewModel.allCinemaMovies.count == 0 {
            ProgressView()
        }else {
            NavigationStack {
                ZStack {
                    Color.black.ignoresSafeArea()
                    
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 16) {
                            ForEach(viewModel.allCinemaMovies) { movie in
                                NavigationLink(value: movie) {
                                    CinemaMovieGridView(movie: movie)
                                }
                            }
                        }
                        .navigationDestination(for: CinemaMovies.self) { movie in
                            CinemaMovieDetailsView(movie: movie)
                        }
                    }
                }
            }
        }
    }
}



// MARK: - Preview
#Preview {
    CinemaMoviesView()
}
