//
//  PeoplesResponseApiMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

struct PeoplesResponseApiMock: PeoplesResponse {
    var count: Int
    
    var next: String?
    
    var previous: String?
    
    var results: [StartWarsPeople.PeoplesSW] {castresults}
    
    private let castresults: [PeoplesApiMock]
    
    init(count: Int, next: String? = nil, previous: String? = nil, castresults: [PeoplesApiMock]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.castresults = castresults
    }
}
