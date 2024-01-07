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
    @Published private(set) var allTVSeriesOnAir = [AppTVSeriesOnAir]()
    private let url = ApiManager.topSeriesBaseUrl + ApiManager.apiKey
    
    // MARK: - Init
    init() {
        fetchSeries()
    }
    
    // MARK: - Methods
    private func fetchSeries() {
        Task {
            if let TVSeriesOnAir: AppMovieSeriesResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allTVSeriesOnAir = TVSeriesOnAir.results
                }
            }
        }
    }
}
