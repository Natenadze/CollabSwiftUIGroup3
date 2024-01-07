//
//  PosterView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct PosterView: View {
    // MARK: - Properties
    let movie: AppMovie
    let posterPath: String
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let cornerRadius: CGFloat?
    
    // MARK: - Body
    var body: some View {
        AsyncImage(url: URL(string: ApiManager.imageBaseUrl + movie.posterPath)) { image in
            posterImageView(image: image)
        } placeholder: {
            emptyStateView()
        }
    }
    
    // MARK: - Content
    private func posterImageView(image: Image) -> some View {
        image.resizable()
            .frame(width: frameWidth, height: frameHeight)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius ?? 0))
    }
    
    private func emptyStateView() -> some View {
        RoundedRectangle(cornerRadius: cornerRadius ?? 0)
            .fill(Color.gray.opacity(0.2))
            .frame(width: frameWidth, height: frameHeight)
    }
}
