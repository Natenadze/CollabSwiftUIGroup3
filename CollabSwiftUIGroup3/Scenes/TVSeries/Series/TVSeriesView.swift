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
            seriesCollectionView()
        }
    }
    
    //MARK: - Content
    private func seriesCollectionView() -> some View {
        ScrollView {
            seriesGridView()
        }
        .navigationTitle("TV Shows")
        .preferredColorScheme(.dark)
        .background(Color.appBackgroundColor)
    }
    
    private func seriesGridView() -> some View {
        LazyVGrid(columns: gridItems, spacing: 12) {
            ForEach(viewModel.seriesCollection) { show in
                let model = GridInfoModel(
                    id: show.id,
                    name: show.name,
                    rating: show.voteAverage,
                    posterUrl: show.posterPath,
                    date: show.firstAirDate
                )
                
                NavigationLink(destination: TVSeriesDetailsPage(series: show)) {
                    AppGridView(series: model)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TVSeriesView()
    }
}
