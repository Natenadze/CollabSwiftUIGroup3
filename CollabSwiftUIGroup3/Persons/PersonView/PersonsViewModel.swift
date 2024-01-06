//
//  PersonsViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 05.01.24.
//

import Foundation
import NatenWorking

class PersonsViewModel: ObservableObject {
    
    //MARK: - Properties
    @Published var allPersons = [Person]()
    private let url = "https://api.themoviedb.org/3/person/popular?api_key=2c4048c6f599fb101b867ea41bf01c69"
    let baseUrl = "https://image.tmdb.org/t/p/w500"
    
    //MARK: - Init
    init() {
        fetchPersons()
    }
    
    //MARK: - Network Call
    private func fetchPersons() {
        Task {
            if let persons: ApiResponse = try? await NetworkManager().performURLRequest(url) {
                await MainActor.run {
                    allPersons = persons.results
                }
            }
        }
    }
}
