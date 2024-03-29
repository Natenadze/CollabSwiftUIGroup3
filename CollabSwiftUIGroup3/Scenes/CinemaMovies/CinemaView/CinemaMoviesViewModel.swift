//
//  CinemaMoviesViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import Foundation
import NatenWorking

final class CinemaMoviesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var allCinemaMovies = [AppMovie]()
    private let url = ApiManager.cinemaBaseUrl + ApiManager.apiKey
    
    // MARK: - Init
    init() {
        fetchMovieCinemas()
    }
    
    // MARK: - Methods
    private func fetchMovieCinemas() {
        Task {
            if let result: AppMoviesResponse = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allCinemaMovies = result.results
                }
            }
        }
    }
    
}
