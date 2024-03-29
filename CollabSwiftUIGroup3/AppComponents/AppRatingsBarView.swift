//
//  AppRatingsBarView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

struct AppCinemaRatingBarView: View {
    // MARK: - Properties
    var selected: Double
    
    // MARK: - Init
    init(selected: Double) {
        self.selected = selected
    }
    
    // MARK: - Body
    var body: some View {
        stars
            .overlay(
                overlay.mask(stars)
            )
    }
    
    // MARK: - Components
    var stars: some View {
        HStack {
            ForEach(0..<5) { _ in
                Image(systemName: "star.fill")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    
    var overlay: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: CGFloat(selected) / 10 * geometry.size.width)
            }
        }
    }
}
