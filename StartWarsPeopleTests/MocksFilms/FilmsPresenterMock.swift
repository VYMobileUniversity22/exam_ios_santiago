//
//  FilmsPresenterMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class FilmsPresenterMock: FilmsPresenterProtocol {
    var view: StartWarsPeople.FilmsViewProtocol?

    var funcGetFilmsCalled = false
    var funcGetFilmsCountWasCalled = false
    var funcFilmsAtIndexCalled = false

    func getFilms() {
        funcGetFilmsCalled = true
    }

    func getFilmsCount() -> Int {
        funcGetFilmsCountWasCalled = true
        return TestConstants.films.count
    }

    func filmsAtIndex(index: Int) -> StartWarsPeople.FilmsSW {
        funcFilmsAtIndexCalled = true
        return TestConstants.films[index]
    }
}
