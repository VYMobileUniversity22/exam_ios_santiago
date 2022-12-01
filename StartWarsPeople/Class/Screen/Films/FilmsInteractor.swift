//
//  FilmsInteractor.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
internal final class FilmsInteractor {
    private let filmsService: FilmsServiceProtocol
    
    var people: PeoplesSW
    
    init(people: PeoplesSW, filmsService: FilmsServiceProtocol = FilmsService()) {
        self.people = people
        self.filmsService = filmsService
    }
}

extension FilmsInteractor: FilmsInteractorProtocol {
    func getFilmsResult(url: String, completion: @escaping (Result<FilmsSW, Error>) -> Void) {
        let filmsService = self.filmsService.getFilmsService()

        filmsService.getFilmsResult(url: url) { result in
            completion(result)
        }
    }
    
    func getFilms() -> PeoplesSW{
        return self.people
    }
}
