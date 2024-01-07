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
    @Published var allPersons = [AppPerson]()
    let url = ApiManager.personsBaseUrl + ApiManager.apiKey

    //MARK: - Init
    init() {
        fetchPersons()
    }
    
    //MARK: - Network Call
    private func fetchPersons() {        
        Task {
                if let persons: AppPersonsResponse = try await NetworkManager().performURLRequest(url) {
                    await MainActor.run {
                        allPersons = persons.results
                    }
                }
        }
    }
    
    
}
