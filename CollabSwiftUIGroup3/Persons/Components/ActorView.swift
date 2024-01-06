//
//  ActorView.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 06.01.24.
//

import SwiftUI

struct ActorView: View {
    //MARK: - Properties
    var person: Person
    //MARK: - Body
    var body: some View {
        VStack {
            Text(person.name)
                .frame(maxWidth: .infinity)
                .font(.system(size: 18))
                .foregroundStyle(.white)
        }
        .padding()
    }
}

