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
    @State var path = NavigationPath()
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    private let backgroundColor = Color(red: 18/255, green: 18/255, blue: 18/255)
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.allTVSeriesOnAir, id: \.id) { series in
                                        NavigationLink(value: series) {
                                            SeriesGridView(series: series)
                                                .padding(10)
                                        }
                    }
                }
            }
            .background(backgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle("TV Series On The Air")
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    TVSeriesOnAirView()
}
