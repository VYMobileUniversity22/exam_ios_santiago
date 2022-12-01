//
//  FilmsInteractorMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class FilmsInteractorMock: FilmsInteractorProtocol {
    var funcGetFilmsResult = false
    var funcGetFilmsCalled = false
    var showError = false
    func getFilmsResult(url: String, completion: @escaping (Result<StartWarsPeople.FilmsSW, Error>) -> Void) {
        funcGetFilmsResult = true
        if showError {
            completion(.failure(TestConstants.error))
        } else {
            completion(.success(TestConstants.film))
        }
    }

    func getFilms() -> StartWarsPeople.PeoplesSW {
        funcGetFilmsCalled = true
        return TestConstants.people
    }
}
