//
//  PersonDetailsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 05.01.24.
//

import SwiftUI

struct PersonDetailsView: View {
    
    //MARK: - ViewModel
    var viewModel: PersonDetailsViewModel

    //MARK: - Body
    var body: some View {
        VStack {
            ActorPhotoView(person: viewModel.person)
            Text("Known For:")
                .font(.title)
            ScrollView(.horizontal) {
                HStack {
                    KnownForScrollView(person: viewModel.person)
                }
            }
            .navigationTitle(viewModel.person.name)
            .preferredColorScheme(.dark)
        }
    }
}
