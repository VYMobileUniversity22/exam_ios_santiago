//
//  PeoplesApiMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

struct PeoplesApiMock: PeoplesSW {
    var name: String
    
    var birthYear: String
    
    var gender: String
    
    var films: [String]
    
    init(name: String, birthYear: String, gender: String, films: [String]) {
        self.name = name
        self.birthYear = birthYear
        self.gender = gender
        self.films = films
    }
}
