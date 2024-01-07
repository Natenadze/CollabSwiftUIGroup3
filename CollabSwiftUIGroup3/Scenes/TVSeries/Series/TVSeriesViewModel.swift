//
//  TVSeriesViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 07.01.24.
//

import Foundation
import NatenWorking

final class TVSeriesViewModel: ObservableObject {
    // MARK: - Properties
    @Published var seriesCollection: [AppTVSeriesOnAir] = []
    private let url = ApiManager.tvSeriesBaseUrl + ApiManager.apiKey

    //MARK: - Init
    init() {
        fetchSeries()
    }
    
    //MARK: - Private functions
    private func fetchSeries() {
        Task {
            if let series: AppMovieSeriesResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    seriesCollection = series.results
                }
            }
        }
    }
}
