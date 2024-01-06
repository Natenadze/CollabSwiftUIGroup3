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
    
    private let key = "put api key here"
    
    // MARK: - Init
    init() {
        fetchSeries()
    }
    
    // MARK: - Methods
    private func fetchSeries() {
        let url = "https://api.themoviedb.org/3/tv/top_rated?api_key=\(key)"
        Task {
            if let TVSeriesOnAir: TVSeriesOnAirResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allTVSeriesOnAir = TVSeriesOnAir.results
                }
            }
        }
    }
}
