//
//  MovieDetailsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: - Properties
    @ObservedObject var viewModel: MovieDetailsViewModel
    @Environment(\.dismiss) var dismiss
    
    // MARK: - Body
    var body: some View {
        detailsView()
    }
    
    // MARK: - Content
    private func detailsView() -> some View {
        GeometryReader { geometry in
            detailsViewContent(geometry: geometry)
                .ignoresSafeArea(.all, edges: .top)
                .navigationBarBackButtonHidden(true)
        }
    }
    
    private func detailsViewContent(geometry: GeometryProxy) -> some View {
        VStack {
            ScrollView {
                moviePosterAndInfoStack(geometry: geometry)
            }
            returnButton()
            Spacer()
        }
    }
    
    private func moviePosterAndInfoStack(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading) {
            PosterView(movie: viewModel.movie,
                       posterPath: viewModel.posterPath,
                       frameWidth: geometry.size.width,
                       frameHeight: 600,
                       cornerRadius: nil)
            
            movieInfoStack()
        }
    }
    
    private func movieInfoStack() -> some View {
        Group {
            movieTitle()
            ratingView()
            movieDescriptionView()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
    }
    
    private func movieTitle() -> some View {
        Text(viewModel.title)
            .font(.system(size: 24, weight: .bold))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white)
            .padding(.top, 16)
    }
    
    private func ratingView() -> some View {
        HStack {
            RatingStarView(frameWidth: 24, frameHeight: 24)
            VoteAverageView(movie: viewModel.movie, font: .system(size: 20))
        }
    }
    
    private func movieDescriptionView() -> some View {
        Text(viewModel.overview)
            .font(.system(size: 18, weight: .regular))
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white.opacity(0.6))
    }
    
    // MARK: - Return Button
    private func returnButton() -> some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.white)
            Text("Return to home page".capitalized)
                .foregroundColor(.white)
                .font(.system(size: 14))
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 54)
        .background(Color.appAccentColor)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}

// MARK: - Preview
#Preview {
    MovieDetailsView(viewModel: MovieDetailsViewModel(movie: MovieMockData.previewExample))
}

