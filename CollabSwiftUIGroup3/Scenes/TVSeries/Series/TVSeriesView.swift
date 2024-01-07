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
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 12) {
                    ForEach(viewModel.seriesCollection) { show in
                        NavigationLink(destination: TVSeriesDetailsPage(series: show)) {
                            AppGridView(series: show)
                        }
                    }
                }
                .navigationTitle("TV Shows")
                .preferredColorScheme(.dark)
                .background(Color.appBackgroundColor)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TVSeriesView()
    }
}
