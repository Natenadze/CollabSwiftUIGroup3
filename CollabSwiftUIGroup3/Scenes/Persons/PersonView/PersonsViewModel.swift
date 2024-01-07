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
    
    //MARK: - Init
    init() {
        fetchPersons()
    }
    
    //MARK: - Network Call
    private func fetchPersons() {
        let url = ApiManager.personsBaseUrl + ApiManager.apiKey
        
        Task {
            do {
                if let persons: AppPersonsResponse = try await NetworkManager().performURLRequest(url) {
                    await MainActor.run {
                        allPersons = persons.results
                    }
                }
            } catch {
                print("Error fetching persons: \(error)")
            }
        }
    }
    
    
}
