//
//  CinemaMovieReviewViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 07.01.24.
//

import Foundation
import NatenWorking

final class CinemaMovieReviewViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var allCinemaMovies = [AppReview]()
    let movieID: String
    
    // MARK: - Init
    init(movieID: Int) {
        self.movieID = String(movieID)
        fetchMovieCinemas()
    }
    
    // MARK: - Methods
    private func fetchMovieCinemas() {
        let url = "https://api.themoviedb.org/3/movie/\(movieID)/reviews?api_key=\(ApiManager.apiKey)"
        Task {
            if let result: AppReviewsResponse = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allCinemaMovies = result.results
                }
            }
        }
    }
    
}
