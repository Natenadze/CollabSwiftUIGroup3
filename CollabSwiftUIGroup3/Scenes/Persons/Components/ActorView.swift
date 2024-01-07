//
//  ActorView.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 06.01.24.
//

import SwiftUI

struct ActorView: View {
    //MARK: - Properties
    var name: String
    
    //MARK: - Body
    var body: some View {
        VStack {
            Text(name)
                .frame(maxWidth: .infinity)
                .font(.system(size: 16))
                .foregroundStyle(.white)
        }
        .padding()
    }
}

