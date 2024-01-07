//
//  KnownForScrollView.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 06.01.24.
//

import SwiftUI

struct KnownForScrollView: View {
    //MARK: - Properties
    var person: AppPerson
    
    //MARK: - Body
    var body: some View {
        
        ForEach(person.knownFor ?? [], id: \.title) { movie in
            VStack {
                Text(movie.title ?? "")
                    .font(.system(size: 10))
                ImageManager(imageUrl: ApiManager.imageBaseUrl + (movie.posterPath ?? ""))
            }
        }
    }
}
