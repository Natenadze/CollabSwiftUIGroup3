//
//  ApiManager.swift
//  CollabSwiftUIGroup3
//
//  Created by Davit Natenadze on 06.01.24.
//

import Foundation


struct ApiManager {
    
    static let apiKey = ""
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    
    static let moviesBaseUrl = "https://api.themoviedb.org/3/movie/popular?api_key="
    static let personsBaseUrl = "https://api.themoviedb.org/3/person/popular?api_key="
    static let tvSeriesBaseUrl = "https://api.themoviedb.org/3/tv/popular?api_key="
    static let cinemaBaseUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key="
    static let topSeriesBaseUrl = "https://api.themoviedb.org/3/tv/top_rated?api_key="
}
