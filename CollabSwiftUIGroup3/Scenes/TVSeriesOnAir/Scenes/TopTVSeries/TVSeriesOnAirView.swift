//
//  TVSeriesOnAirView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct TVSeriesOnAirView: View {
    // MARK: - Properties
    @StateObject private var viewModel = TVSeriesOnAirViewModel()
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.allTVSeriesOnAir) { series in
                        let model = GridInfoModel(
                            id: series.id,
                            name: series.name,
                            rating: series.voteAverage,
                            posterUrl: series.posterPath,
                            date: series.firstAirDate
                        )
                        
                        NavigationLink(value: series) {
                            AppGridView(series: model)
                        }
                    }
                }
                .background(Color.appBackgroundColor)
                .scrollContentBackground(.hidden)
                .navigationTitle("🔥 Popular TV Shows")
                .preferredColorScheme(.dark)
                .navigationDestination(for: AppTVSeriesOnAir.self) { show in
                    TVSeriesReviewsView(viewModel: TVSeriesReviewsViewModel(series: show))
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    TVSeriesOnAirView()
}
