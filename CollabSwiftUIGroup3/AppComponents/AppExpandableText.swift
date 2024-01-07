//
//  AppExpandableText.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 07.01.24.
//

import SwiftUI

struct AppExpandableText: View {
    // MARK: - Properties
    @State private var isExpanded: Bool = false
    let text: String
    let lineLimit: Int
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .trailing) {
            Text(text)
                .lineLimit(isExpanded ? nil : lineLimit)
                .fixedSize(horizontal: false, vertical: true)
            
            Button(action: {
                withAnimation { isExpanded.toggle() }
            }) {
                Text(isExpanded ? "See Less" : "See More")
                    .foregroundColor(Color.appAccentColor)
                    .font(.subheadline)
            }
        }
    }
}
