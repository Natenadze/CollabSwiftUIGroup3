//
//  TVSeriesOnAirViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import Foundation
import NatenWorking

final class TVSeriesOnAirViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var allTVSeriesOnAir = [TVSeriesOnAir]()
    
    private let key = "2c4048c6f599fb101b867ea41bf01c69"
    
    // MARK: - Init
    init() {
        fetchMovies()
    }
    
    // MARK: - Methods
    private func fetchMovies() {
        let url = "https://api.themoviedb.org/3/tv/on_the_air?api_key=\(key)"
        Task {
            if let TVSeriesOnAir: TVSeriesOnAirResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allTVSeriesOnAir = TVSeriesOnAir.results
                }
            }
        }
    }
}
