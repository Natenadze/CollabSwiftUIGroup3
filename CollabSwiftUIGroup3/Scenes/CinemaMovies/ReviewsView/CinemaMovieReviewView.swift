//
//  CinemaMovieReviewView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 07.01.24.
//


import SwiftUI

struct CinemaMovieReviewsView: View {
    // MARK: - Properties
    @StateObject var viewModel: CinemaMovieReviewViewModel
    
    // MARK: - Body
    var body: some View {
        if viewModel.allCinemaMovies.isEmpty {
            AppEmptyReviewsView()
        } else {
            cinemaMoviesReviewList
        }
    }
}


// MARK: - Extensions
extension CinemaMovieReviewsView {
    
    private var cinemaMoviesReviewList: some View {
        ScrollView {
            ForEach(viewModel.allCinemaMovies, id: \.author) { review in
                AppMovieReviewsView(review: review)
            }
        }
    }
}



// MARK: - Preview
#Preview {
    CinemaMovieReviewsView(viewModel: CinemaMovieReviewViewModel(movieID: 572802))
}
