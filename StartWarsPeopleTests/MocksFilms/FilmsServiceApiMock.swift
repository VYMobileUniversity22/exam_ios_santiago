//
//  FilmsServiceApiMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class FilmsServiceApiMock: FilmsServiceContract {
    func getFilmsResult(url: String, completion: @escaping (Result<StartWarsPeople.FilmsSW, Error>) -> Void) {
        completion(.success(TestConstants.film))
    }
}
