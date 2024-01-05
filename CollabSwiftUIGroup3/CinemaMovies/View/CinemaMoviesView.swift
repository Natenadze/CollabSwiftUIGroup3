//
//  CinemaMoviesView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct CinemaMoviesView: View {
    
    @StateObject private var viewModel = CinemaMoviesViewModel()
    
    
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 250), spacing: 20)
    ]
    
    // MARK: - Body
    var body: some View {
        if viewModel.allCinemaMovies.count == 0 {
            Text("wait")
        }else {
            NavigationStack {
                ZStack {
                    Color.black.ignoresSafeArea()
                    
                    ScrollView {
                        LazyVGrid(columns: gridItems, spacing: 16) {
                            ForEach(viewModel.allCinemaMovies) { movie in
                                NavigationLink(value: movie) {
                                    MovieGridView(movie: movie)
                                }
                            }
                        }
                        .navigationDestination(for: Movies.self) { movie in
                            MovieDetailsView(movie: movie)
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
