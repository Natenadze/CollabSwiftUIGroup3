//
//  KnownForScrollView.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 06.01.24.
//

import SwiftUI

struct KnownForScrollView: View {
    //MARK: - Properties
    var person: Person
    var baseUrl: String
    //MARK: - Body
    var body: some View {
        
        ForEach(person.knownFor, id: \.title) { movie in
            VStack {
                Text(movie.title ?? "")
                    .font(.system(size: 10))
                AsyncImage(url: URL(string: baseUrl + (movie.posterPath ?? ""))) { image in
                    image.resizable()
                        .frame(width:160, height: 250)
                        .cornerRadius(8.0)
                } placeholder: {
                    ProgressView()
                        .frame(width:160, height: 250)
                        .foregroundStyle(.white)
                }
            }
        }
    }
}
