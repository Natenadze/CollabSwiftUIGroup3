//
//  MoviesViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import Foundation
import NatenWorking

final class MoviesViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var allMovies = [AppMovie]()
    private let url = ApiManager.moviesBaseUrl + ApiManager.apiKey
    
    // MARK: - Init
    init() {
        fetchMovies()
    }
    
    // MARK: - Methods
    private func fetchMovies() {
        Task {
            if let movies: AppMoviesResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allMovies = movies.results
                }
            }
        }
    }
}
