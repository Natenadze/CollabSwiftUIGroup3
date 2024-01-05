//
//  TVSeriesReviewsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct TVSeriesReviewsView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: TVSeriesReviewsViewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            if viewModel.allReviews.isEmpty {
                ProgressView()
            } else {
                List(viewModel.allReviews, id: \.author) { review in
                    Text("Review by \(review.author): \(review.content)")
                }
            }
        }
        .onAppear {
            viewModel.fetchReviews()
        }
    }
}

#Preview {
    TVSeriesReviewsView(viewModel: TVSeriesReviewsViewModel(series: TVSeriesOnAir(id: 15, overview: "Test", posterPath: "placeholder", firstAirDate: "12.09", name: "Test", voteAverage: 4.5)))
}
