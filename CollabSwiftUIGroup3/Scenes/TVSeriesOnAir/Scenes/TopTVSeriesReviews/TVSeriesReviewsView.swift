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
        
        if viewModel.allReviews.isEmpty {
            AppEmptyReviewsView()
        }else {
            reviewsScrollView
        }
        
    }
}

// MARK: - Extensions
extension TVSeriesReviewsView {
    
    private var reviewsScrollView: some View {
        ScrollView {
            ForEach(viewModel.allReviews, id: \.author) { review in
                AppReviewsView(review: review)
            }
        }
        .navigationTitle(viewModel.series.name)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchReviews()
        }
    }
}
