//
//  CinemaMoviesViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import Foundation
import NatenWorking

final class CinemaMoviesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var allCinemaMovies = [CinemaMovies]()
    let imageUrlBase = "https://image.tmdb.org/t/p/w500"
    let apiKey = "2c4048c6f599fb101b867ea41bf01c69"
    
    
    // MARK: - Init
    init() {
        fetchMovieCinemas()
    }
    
    // MARK: - Methods
    private func fetchMovieCinemas() {
        let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)"
        
        Task {
            if let result: CinemaModel = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allCinemaMovies = result.results
                }
            }
        }
    }
    
}
