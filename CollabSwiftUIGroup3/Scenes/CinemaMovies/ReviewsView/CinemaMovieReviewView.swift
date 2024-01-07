//
//  CinemaMovieReviewView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 07.01.24.
//


import SwiftUI

struct CinemaMovieReviewsView: View {
    // MARK: - Properties
    @StateObject var viewModel: CinemaMovieReviewViewModel
    
    // MARK: - Body
    var body: some View {
        if viewModel.allCinemaMovies.isEmpty {
            Text("No reviews available ☹️".capitalized)
                .font(.title)
                .foregroundColor(.gray)
        } else {
            ScrollView {
                ForEach(viewModel.allCinemaMovies, id: \.author) { review in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 20, height: 20)
                            
                            Text(review.author)
                                .font(.headline)
                        }
                        
                        HStack {
                            AppCinemaRatingBarView(selected: Double(review.authorDetails.rating))
                            
                            Text(String(review.authorDetails.rating) + "/10")
                                .font(.subheadline)
                        }
                        
                        AppExpandableText(text: review.content, lineLimit: 10)
                            .padding()
                    }
                }
            }
        }
    }
}



// MARK: - Preview
#Preview {
    CinemaMovieReviewsView(viewModel: CinemaMovieReviewViewModel(movieID: 572802))
}
