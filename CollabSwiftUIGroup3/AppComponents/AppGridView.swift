//
//  AppGridView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

protocol GridInfoProtocol {
    var name: String { get }
    var rating: Double { get }
    var posterUrl: String { get }
    var date: String { get }
}

struct AppGridView: View {
    // MARK: - Properties
    let series: GridInfoModel
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ImageManager(imageUrl: ApiManager.imageBaseUrl + series.posterUrl)
            
            VStack(alignment: .leading, spacing: 4) {
                seriesRating
                seriesName
                seriesDate
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Extension
private extension AppGridView {
    var seriesRating: some View {
        HStack(alignment: .center, spacing: 8) {
            AppCinemaRatingBarView(selected: series.rating)
            
            Text("\(series.rating, specifier: "%.1f")")
                .font(.system(size: 16))
                .foregroundStyle(.black.opacity(0.8))
        }
        
    }
    
    var seriesName: some View {
        Text(series.name)
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(.black)
            .lineLimit(1)
    }
    
    var seriesDate: some View {
        Text(series.date)
            .font(.system(size: 14))
            .foregroundStyle(.black.opacity(0.8))
    }
}
