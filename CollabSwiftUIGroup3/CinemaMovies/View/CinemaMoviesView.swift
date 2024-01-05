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
        GridItem(.adaptive(minimum: 150, maximum: 250))
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
                        LazyVGrid(columns: gridItems, spacing: 10) {
                            ForEach(viewModel.allCinemaMovies) { movie in
                                NavigationLink(value: movie) {
                                    ProductGridView(movie: movie)
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

struct ProductGridView: View {
    
    // MARK: - properties
    
    let movie: Movies
    
    // MARK: - init
    init(movie: Movies) {
        self.movie = movie
    }
    
    // MARK: - body
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
                .foregroundStyle(.white)
                .lineLimit(2)
            RatingBarView(selected: movie.voteAverage)
        }
        
        
    }
}



#Preview {
    CinemaMoviesView()
}
