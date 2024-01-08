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
            seriesDetailsContent
        }
        .navigationTitle(series.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Extension
extension TVSeriesDetailsPage {
    //MARK: - Content
    private var seriesDetailsContent: some View {
        VStack(alignment: .leading, spacing: 15) {
            imageView
            seriesTitle
            airDate
            votesAverage
            overview
        }
        .padding()
        .foregroundColor(.white)
    }
}

// MARK: - Components
private extension TVSeriesDetailsPage {
    var imageView: some View {
        let url = ApiManager.imageBaseUrl + series.posterPath
        return ImageManager(imageUrl: url)
    }
    
    var seriesTitle: some View {
        Text(series.name)
            .font(.title)
    }
    
    var airDate: some View {
        Text("\(series.firstAirDate)")
    }
    
    var votesAverage: some View {
        HStack{
            Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 20))
            
            Text("\(series.voteAverage, specifier: "%.1f")")
                .foregroundColor(.gray)
        }
    }
    
    var overview: some View {
        Text("\(series.overview)")
            .font(.body)
            .foregroundColor(.white)
    }
}
