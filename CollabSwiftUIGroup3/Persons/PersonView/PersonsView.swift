//
//  PersonsView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct PersonsView: View {
    
    //MARK: - ViewModel & Grid Setup
    
    @ObservedObject private var viewModel = PersonsViewModel()
    private let columns = [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 10)]
    
    //MARK: - Body
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10, content: {
                    ForEach(viewModel.allPersons) { person in
                        NavigationLink(destination: PersonDetailsView(viewModel: PersonDetailsViewModel(person: person, baseUrl: viewModel.baseUrl))) {
                            VStack {
                                ActorPhotoView(baseUrl: viewModel.baseUrl, person: person)
                                ActorView(person: person)
                            }
                        }
                    }
                })
                .padding()
                .background(.black)
                .preferredColorScheme(.dark)
                .navigationTitle("Popular Actors")
            }
        }
    }
}

#Preview {
    PersonsView()
}
