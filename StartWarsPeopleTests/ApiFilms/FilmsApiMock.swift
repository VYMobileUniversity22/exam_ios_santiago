//
//  FilmsApiMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

struct FilmsApiMock: FilmsSW {
    var title: String

    var director: String

    var releaseDate: String

    init(title: String, director: String, releaseDate: String) {
        self.title = title
        self.director = director
        self.releaseDate = releaseDate
    }
}
