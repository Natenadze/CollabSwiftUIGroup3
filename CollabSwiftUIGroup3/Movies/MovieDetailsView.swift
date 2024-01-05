//
//  MovieDetailsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: - Properties
    @StateObject var viewModel: MovieDetailsViewModel
    
    private let backgroundColor = Color(red: 18/255, green: 18/255, blue: 18/255)
    private let accentColor = Color(red: 229/255, green: 8/255, blue: 21/255)
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        PosterView(movie: viewModel.movie,
                                   posterPath: viewModel.posterPath,
                                   frameWidth: geometry.size.width,
                                   frameHeight: 600,
                                   cornerRadius: nil)
                        
                        movieDescription()
                    }
                }
                returnButton()
                Spacer()
            }
            .ignoresSafeArea(.all, edges: .top)
        .navigationBarBackButtonHidden(true)
    }
    }
    
    // MARK: - Content
    private func movieDescription() -> some View {
        Group {
            Text(viewModel.title)
                .font(.system(size: 24, weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white)
                .padding(.top, 16)
            HStack {
                RatingStarView(frameWidth: 24, frameHeight: 24)
                VoteAverageView(movie: viewModel.movie, font: .system(size: 20))
            }
            
            Text(viewModel.overview)
                .font(.system(size: 18, weight: .regular))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 6)
    }

    // MARK: - Return Button
    private func returnButton() -> some View {
        Button {
            if !viewModel.path.isEmpty {
                    viewModel.path.removeLast(viewModel.path.count)
                }
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
        .background(accentColor)
        .cornerRadius(8)
        .padding(.horizontal, 16)
    }
}

// MARK: - Preview
#Preview {
    MovieDetailsView(viewModel: MovieDetailsViewModel(movie: MovieMockData.previewExample,
                                                      path: MovieMockData().$path))
}

