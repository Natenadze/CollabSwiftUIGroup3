//
//  TVSeriesDetailsPage.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 07.01.24.
//

import SwiftUI

struct TVSeriesDetailsPage: View {
    
    //MARK: - Properties
    var series: AppTVSeriesOnAir
    
    //MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                
                imageView(series: series)
                
                Text(series.name)
                    .font(.title)
                
                Text("\(series.firstAirDate)")
                
                votesAverage(series: series)
                
                Text("\(series.overview)")
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding()
            .foregroundColor(.white)
        }
        .navigationTitle(series.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //MARK: - Content
    private func votesAverage(series: AppTVSeriesOnAir) -> some View {
        HStack{
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 20))
            
            Text("\(series.voteAverage, specifier: "%.1f")")
                .foregroundColor(.gray)
        }
    }

    private func imageView(series: AppTVSeriesOnAir) -> some View {
        AsyncImage(url: URL(string: (ApiManager.imageBaseUrl) + (series.posterPath))) { image in
            image.resizable()
                .scaledToFill()
        } placeholder: {
            Image(systemName: "photo.fill")
                .resizable()
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.gray)
        }
    }
}
