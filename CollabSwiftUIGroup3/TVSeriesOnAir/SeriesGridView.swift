//
//  SeriesGridView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct SeriesGridView: View {
    // MARK: - Properties
    let series: TVSeriesOnAir
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(series.posterPath)")) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "star.fill")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 16)
                    
                    Text("\(series.voteAverage, specifier: "%.1f")")
                        .font(.system(size: 16))
                            .foregroundStyle(.black.opacity(0.8))
                }
                Text(series.name)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(.black)
                    .lineLimit(1)
                
                Text(series.firstAirDate)
                    .font(.system(size: 14))
                    .foregroundStyle(.black.opacity(0.8))
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Preview
#Preview {
    SeriesGridView(series: TVSeriesOnAir(id: 12, overview: "Test", posterPath: "placeholder", firstAirDate: "12", name: "Test", voteAverage: 1.5))
}
