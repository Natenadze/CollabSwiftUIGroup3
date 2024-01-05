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
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 12) {
                                if let avatarPath = review.authorDetails.avatarPath,
                                   let url = URL(string: "https://image.tmdb.org/t/p/w500\(avatarPath)") {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        Circle()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(.gray.opacity(0.2))
                                            .overlay(
                                                Image(systemName: "person.fill")
                                                    .resizable()
                                                    .frame(width: 16, height: 16)
                                                    .foregroundColor(.white)
                                            )
                                    }
                                } else {
                                    Circle()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(.gray)
                                        .overlay(
                                            Image(systemName: "person.fill")
                                                .resizable()
                                                .frame(width: 16, height: 16)
                                                .foregroundColor(.white)
                                        )
                                }
                                Text("\(review.author):")
                                    .font(.system(size: 18))
                                
                                Spacer()
                                
                                HStack(alignment: .center, spacing: 10) {
                                    Image(systemName: "star.fill")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                    HStack(spacing: nil) {
                                        Text("\(review.authorDetails.rating)")
                                            .font(.system(size: 20))
                                            .foregroundStyle(.white)
                                        
                                        Text("/ 10")
                                            .font(.system(size: 16))
                                            .foregroundStyle(.white.opacity(0.6))
                                    }
                                }
                            }
                            
                            Text(review.content)
                                .font(.body)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(16)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.gray.opacity(0.2))
                        )
                    }
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
