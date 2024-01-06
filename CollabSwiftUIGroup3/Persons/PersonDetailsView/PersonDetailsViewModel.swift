//
//  PersonDetailsViewModel.swift
//  CollabSwiftUIGroup3
//
//  Created by Nikoloz Gachechiladze on 05.01.24.
//

import Foundation

class PersonDetailsViewModel {
    
    //MARK: - Properties
    
    var person: Person
    let baseUrl: String
    
    //MARK: - Init
    
    init(person: Person, baseUrl: String) {
        self.person = person
        self.baseUrl = baseUrl
    }
}
