//
//  AppReviewsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

struct AppReviewsView: View {
    // MARK: - Properties
    let review: AppReview
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                content(review: review)
            }
            .padding(16)
        }
    }
    
    // MARK: - Content
    private func content(review: AppReview) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                
                avatarImage(review: review)
                
                Text("\(review.author):")
                    .font(.system(size: 18))
                
                Spacer()
                
                reviewStack(review: review)
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
    
    private func avatarImage(review: AppReview) -> AnyView {
        if let avatarPath = review.authorDetails.avatarPath,
           let url = URL(string: (ApiManager.imageBaseUrl) + (avatarPath)) {
            return AnyView(
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } placeholder: {
                    placeholderShape()
                })
        } else {
            return AnyView(
                placeholderShape()
            )
        }
    }
    
    private func placeholderShape() -> some View {
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
    
    private func reviewStack(review: AppReview) -> some View {
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
}
