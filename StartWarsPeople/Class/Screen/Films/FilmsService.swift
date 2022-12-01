//
//  FilmsService.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
internal final class FilmsService: FilmsServiceProtocol {
    private let filmsService: FilmsServiceContract

    init(filmsService: FilmsServiceContract = FilmsServiceApi()) {
        self.filmsService = filmsService
    }

    func getFilmsService() -> FilmsServiceContract {
        return filmsService
    }
}
