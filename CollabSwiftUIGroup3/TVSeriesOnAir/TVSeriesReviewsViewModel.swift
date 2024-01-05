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

    private var series: TVSeriesOnAir
    private let key = "2c4048c6f599fb101b867ea41bf01c69"
    
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

 
