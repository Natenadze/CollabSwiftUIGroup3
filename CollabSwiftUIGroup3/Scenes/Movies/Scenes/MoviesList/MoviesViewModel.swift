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
    @Published private(set) var allMovies = [Movie]()
    
    private let key = ""
    
    // MARK: - Init
    init() {
        fetchMovies()
    }
    
    // MARK: - Methods
    private func fetchMovies() {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=\(key)"
        Task {
            if let movies: MoviesResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allMovies = movies.results
                }
            }
        }
    }
}
