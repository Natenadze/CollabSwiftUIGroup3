//
//  AppMovieReviewView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 07.01.24.
//

import SwiftUI

struct AppMovieReviewView: View {
    // MARK: - Properties
    @StateObject var viewModel: CinemaMovieReviewViewModel
    
    // MARK: - Body
    var body: some View {
        if viewModel.allCinemaMovies.isEmpty {
            Text("No reviews available ☹️".capitalized)
                .font(.title)
                .foregroundColor(.gray)
        } else {
            reviewViewsList
        }
    }
}

// MARK: - Extensions
private extension AppMovieReviewView {
    
    var reviewViewsList: some View {
        ScrollView {
            ForEach(viewModel.allCinemaMovies, id: \.author) { review in
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
    }
}


// MARK: - Preview
#Preview {
    AppMovieReviewView(viewModel: CinemaMovieReviewViewModel(movieID: 572802))
}
