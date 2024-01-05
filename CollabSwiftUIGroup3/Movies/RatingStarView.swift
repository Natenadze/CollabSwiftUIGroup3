//
//  RatingStarView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct RatingStarView: View {
    // MARK: - Properties
    let frameWidth: CGFloat
    let frameHeight: CGFloat

    // MARK: - Body
    var body: some View {
        Image(systemName: "star.fill")
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: frameWidth, height: frameHeight)
    }
}
