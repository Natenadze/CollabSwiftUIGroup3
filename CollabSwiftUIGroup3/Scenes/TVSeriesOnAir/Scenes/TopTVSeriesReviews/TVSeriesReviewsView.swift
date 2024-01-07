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
        ScrollView {
            VStack(spacing: 32) {
                
                if !viewModel.allReviews.isEmpty {
                    ForEach(viewModel.allReviews, id: \.author) { review in
                        AppReviewsView(review: review)
                    }
                } else {
                    Text("No reviews available ☹️".capitalized)
                        .font(.title)
                        .foregroundColor(.gray)
                }
            }
            .padding(16)
        }
        .navigationTitle(viewModel.series.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchReviews()
        }
    }
}
