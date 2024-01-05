//
//  VoteAverageView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct VoteAverageView: View {
    // MARK: - Properties
    let movie: Movie
    let font: Font

    // MARK: - Body
    var body: some View {
        Text("\(movie.voteAverage, specifier: "%.1f")")
            .font(font)
            .foregroundStyle(.white)
    }
}


/*
 private func voteAverageView(movie: Movie) -> some View {
     Text("\(movie.voteAverage, specifier: "%.1f")")
         .font(.system(size: 16))
         .foregroundStyle(.white)
 }
 
 */
