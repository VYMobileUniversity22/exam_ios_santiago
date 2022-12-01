//
//  FilmsServiceContract.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
protocol FilmsServiceContract {
    func getFilmsResult(url: String, completion: @escaping (Result<FilmsSW, Error>) -> Void)
}
