//
//  FilmsContract.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit

protocol FilmsViewProtocol: BaseProtocol {
    func loadFilms()
}

protocol FilmsPresenterProtocol {
    var view: FilmsViewProtocol? { get set }

    func getFilms()


    func getFilmsCount() -> Int
    func filmsAtIndex(index: Int) -> FilmsSW
}

protocol FilmsInteractorProtocol {
    func getFilmsResult(url: String, completion: @escaping (Result<FilmsSW, Error>) -> Void)
    func getFilms() -> PeoplesSW
}

protocol FilmsServiceProtocol {
    func getFilmsService() -> FilmsServiceContract
}

protocol FilmsCoordinatorDelegate {
    func goToDetailScreen(sender: UIViewController)
}
