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
    
    let imageUrlBase = "https://image.tmdb.org/t/p/w500"
    
    let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=2c4048c6f599fb101b867ea41bf01c69#"
    
    @Published var allCinemaMovies = [Movies]()
    
    // MARK: - Init
    init() {
        fetchMovieCinemas(url)
    }
    
    // MARK: - Methods
    private func fetchMovieCinemas(_ url: String) {
        Task {
            if let result: CinemaModel = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allCinemaMovies = result.results
                }
            }
        }
    }
    
}
