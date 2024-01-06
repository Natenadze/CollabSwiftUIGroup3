//
//  ActorPhotoView.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 06.01.24.
//

import SwiftUI

struct ActorPhotoView: View {
    //MARK: - Properties
    var baseUrl: String
    var person: Person
    //MARK: - Body
    var body: some View {
        AsyncImage(url: URL(string: baseUrl + (person.profilePath))) { image in
            image.resizable()
                .scaledToFit()
                .cornerRadius(8.0)
        } placeholder: {
            ProgressView()
                .frame(width: 120, height: 180)
                .foregroundStyle(.white)
        }    }
}

