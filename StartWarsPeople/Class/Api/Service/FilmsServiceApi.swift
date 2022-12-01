//
//  FilmsServiceApi.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
public class FilmsServiceApi: FilmsServiceContract {
    var apiManager: ApiManagerProtocol

    init(apiManager: ApiManagerProtocol = ApiManager()) {
        self.apiManager = apiManager
    }

    func getFilmsResult(url: String, completion: @escaping (Result<FilmsSW, Error>) -> Void) {
        apiManager.apiCall(for: url) { (result: Result<FilmsApi, Error>) in
            switch result {
            case let .success(films):
                completion(.success(films))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
