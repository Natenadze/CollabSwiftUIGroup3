//
//  TVSeriesView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct TVSeriesView: View {
    //MARK: - Properties
    @StateObject var viewModel = TVSeriesViewModel()
    private let gridItems: [GridItem] = [GridItem(.adaptive(minimum: 150, maximum: 250))]
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            seriesCollectionView
        }
    }
}

// MARK: - Extension
extension TVSeriesView {
    private var seriesCollectionView: some View {
        ScrollView {
            seriesGridView
        }
        .navigationTitle("TV Shows")
        .background(Color.appBackgroundColor)
    }
    
    private var seriesGridView: some View {
        LazyVGrid(columns: gridItems, spacing: 12) {
            ForEach(viewModel.seriesCollection) { series in
                navigationToTvSeriesDetails(series: series)
            }
        }
    }
    
    private func navigationToTvSeriesDetails(series: AppTVSeriesOnAir) -> some View {
        let model = viewModel.getGridInfoModel(from: series)
        return NavigationLink(destination: TVSeriesDetailsPage(series: series)) {
            AppGridView(series: model)
        }
    }
}


// MARK: - Preview
#Preview {
    TVSeriesView()
}
