//
//  AppGridView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

struct AppGridView {
    // MARK: - Properties
    let series: AppTVSeriesOnAir
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            seriesImage(series: series)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(alignment: .center, spacing: 8) {
                    AppCinemaRatingBarView(selected: series.voteAverage)
                    seriesRating(series: series)
                }
                seriesName(series: series)
                seriesDate(series: series)
            }
            .padding(.horizontal, 6)
            .padding(.bottom, 6)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    // MARK: - Content
    private func seriesImage(series: AppTVSeriesOnAir) -> some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(series.posterPath)")) { image in
            image.resizable()
                .scaledToFill()
        } placeholder: {
            Image(systemName: "photo.fill")
        }
    }
    
 
    private func seriesRating(series: AppTVSeriesOnAir) -> some View {
        Text("\(series.voteAverage, specifier: "%.1f")")
            .font(.system(size: 16))
            .foregroundStyle(.black.opacity(0.8))
    }
    
    private func seriesName(series: AppTVSeriesOnAir) -> some View {
        Text(series.name)
            .font(.system(size: 18, weight: .medium))
            .foregroundStyle(.black)
            .lineLimit(1)
    }
    
    private func seriesDate(series: AppTVSeriesOnAir) -> some View {
        Text(series.firstAirDate)
            .font(.system(size: 14))
            .foregroundStyle(.black.opacity(0.8))
    }
}
