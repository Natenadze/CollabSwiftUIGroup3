//
//  TVSeriesReviewsViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import Foundation
import NatenWorking

final class TVSeriesReviewsViewModel: ObservableObject {
    // MARK: - Properties
    @Published private(set) var allReviews = [AppReview]()
    var series: AppTVSeriesOnAir
    
    // MARK: - Init
    init(series: AppTVSeriesOnAir) {
        self.series = series
        fetchReviews()
    }
    
    // MARK: - Methods
    func fetchReviews() {
        let url = "https://api.themoviedb.org/3/tv/\(series.id)/reviews?api_key=\(ApiManager.apiKey)"
        Task {
            if let reviews: AppReviewsResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allReviews = reviews.results
                }
            }
        }
    }
}


