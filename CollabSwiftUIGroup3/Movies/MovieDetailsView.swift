//
//  MovieDetailsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Ani's Mac on 05.01.24.
//

import SwiftUI

struct MovieDetailsView: View {
    // MARK: - Properties
    @StateObject var viewModel: MovieDetailsViewModel
    
    private let backgroundColor = Color(red: 18/255, green: 18/255, blue: 18/255)

    // MARK: - Body
    var body: some View {
        Text("Hello, World!")
    }
        
}

#Preview {
    MovieDetailsView(viewModel: MovieDetailsViewModel(movie: MovieMockData.previewExample,
                                                      path: MovieMockData().$path))
}

