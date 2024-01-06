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
    @Published private(set) var allReviews = [Review]()
    
    var series: TVSeriesOnAir
    private let key = "put api key here"
    
    // MARK: - Init
    init(series: TVSeriesOnAir) {
        self.series = series
    }
    
    // MARK: - Methods
    func fetchReviews() {
        let url = "https://api.themoviedb.org/3/tv/\(series.id)/reviews?api_key=\(key)"
        Task {
            if let reviews: ReviewsResponse = try await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allReviews = reviews.results
                }
            }
        }
    }
}


