//
//  FilmsPresenter.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
internal final class FilmsPresenter{
    var view: FilmsViewProtocol?
    var interactor: FilmsInteractorProtocol
    var storeManager: StoreManagerProtocol
    var people = [String]()
    var films = [FilmsSW]()
    
    init( interactor: FilmsInteractorProtocol, storeManager: StoreManagerProtocol = StoreManager.shared) {
        self.storeManager = storeManager
        self.interactor = interactor
    }
}
extension FilmsPresenter: FilmsPresenterProtocol{
    func getFilms() {
        view?.loadIndicator(indicatorBool: true)
        self.people = interactor.getFilms().films
        for character in people{
            interactor.getFilmsResult(url: character) {
                result in
                switch result {
                case.failure(_):
                    self.view?.showError(message: "No hay internet, intentelo mas tarde")
                    self.view?.loadIndicator(indicatorBool: false)

                case.success(let film):
                    self.films.append(film)
                    self.view?.loadFilms()
                    self.sortArray()
                    self.view?.loadIndicator(indicatorBool: false)

                }
            }
        }
    }
    
    func getFilmsCount() -> Int {
        return self.films.count
    }
    
    func filmsAtIndex(index: Int) -> FilmsSW {
        return self.films[index]
    }
    
    func sortArray() {
        films = films.sorted(by: { $0.releaseDate > $1.releaseDate })
        }
}
