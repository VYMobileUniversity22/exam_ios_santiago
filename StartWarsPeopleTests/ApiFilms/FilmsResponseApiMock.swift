//
//  FilmsResponseApiMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

struct FilmsResponseApiMock: FilmsResponse {
    var results: [StartWarsPeople.FilmsSW] { castresults }

    private let castresults: [FilmsApiMock]

    init(castresults: [FilmsApiMock]) {
        self.castresults = castresults
    }
}
