//
//  AppTabBarView.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import SwiftUI

struct AppTabBarView: View {
    var body: some View {
        TabView {
            MoviesView()
                .tabItem { Label("Movies", systemImage: "movieclapper") }
            
            PersonsView()
                .tabItem { Label("Persons", systemImage: "person.2.fill") }
            
            Color.yellow
                .tabItem { Label("TV Series", systemImage: "play.tv.fill") }
            
            CinemaMoviesView()
                .tabItem { Label("Cinema", systemImage: "popcorn.fill") }
            
            TVSeriesOnAirView()
                .tabItem { Label("Top Shows", systemImage: "list.star") }
        }
        .tint(Color.appAccentColor)
    }
}
