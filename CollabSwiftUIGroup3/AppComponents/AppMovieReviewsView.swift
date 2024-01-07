//
//  AppMovieReviewView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 07.01.24.
//

import SwiftUI

struct AppMovieReviewsView: View {
    // MARK: - Properties
    var review: AppReview
    
    // MARK: - Body
    var body: some View {
            reviewViewsList
    }
}

// MARK: - Extensions
private extension AppMovieReviewsView {
    
    var reviewViewsList: some View {
            
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(8)
                            .background(
                                Color.gray.opacity(0.3)
                            )
                            .clipShape(Circle())
                        
                        Text(review.author)
                            .font(.headline)
                    }
                    
                    HStack {
                        AppCinemaRatingBarView(selected: Double(review.authorDetails.rating))
                        
                        Text(String(review.authorDetails.rating) + "/10")
                            .font(.subheadline)
                    }
                    
                    AppExpandableText(text: review.content, lineLimit: 7)
                        .padding()
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.gray.opacity(0.2))
                )
    }
}


//// MARK: - Preview
//#Preview {
//    AppMovieReviewsView(viewModel: CinemaMovieReviewViewModel(movieID: 572802))
//}
