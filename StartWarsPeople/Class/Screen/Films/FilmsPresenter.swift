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
        self.people = interactor.getFilms().films
        
        for character in people{
            interactor.getFilmsResult(url: character) {
                result in
                switch result {
                case.failure(let error):
                    self.view?.showError(message: error.localizedDescription)
                case.success(let film):
                    self.films.append(film)
                    self.view?.loadFilms()
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
    

    
    
}
