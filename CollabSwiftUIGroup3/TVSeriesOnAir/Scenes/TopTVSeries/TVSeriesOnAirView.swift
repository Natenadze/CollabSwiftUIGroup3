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
    private let backgroundColor = Color(red: 18/255, green: 18/255, blue: 18/255)
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.allTVSeriesOnAir, id: \.id) { series in
                        NavigationLink(value: series) {
                            SeriesGridView(series: series)
                                .padding(4)
                        }
                    }
                }
                .navigationDestination(for: TVSeriesOnAir.self) { show in
                    TVSeriesReviewsView(viewModel: TVSeriesReviewsViewModel(series: show))
                }
                .background(backgroundColor)
                .scrollContentBackground(.hidden)
                .navigationTitle("🔥 Popular TV Shows")
                .preferredColorScheme(.dark)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    TVSeriesOnAirView()
}
