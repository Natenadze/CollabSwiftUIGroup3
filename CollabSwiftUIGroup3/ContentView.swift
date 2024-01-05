//
//  ContentView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 05.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Color.red
                .tabItem { Label("Ani", systemImage: "house") }
                
            Color.blue
                .tabItem { Label("Nika", systemImage: "person") }
            
            Color.orange
                .tabItem { Label("Tekla", systemImage: "house") }
            
            Color.yellow
                .tabItem { Label("Naten", systemImage: "house") }
            
            Color.cyan
                .tabItem { Label("all", systemImage: "house") }
        }
    }
}

#Preview {
    ContentView()
}
