//
//  ImageManager.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 07.01.24.
//

import SwiftUI

struct ImageManager: View {
    // MARK: - Properties
    let imageUrl: String
    
    // MARK: - Body
    var body: some View {
        AsyncImage(url: URL(string: imageUrl), content: { image in
            image
                .resizable()
                .scaledToFit()
        }) {
            ProgressView()
        }
    }
}

