//
//  FilmsServiceApi.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import Foundation
public class FilmsServiceApi: FilmsServiceContract {
    var apiManager: ApiManagerProtocol

    init(apiManager: ApiManagerProtocol = ApiManager()) {
        self.apiManager = apiManager
    }

    func getFilmsResult(url: String, completion: @escaping (Result<FilmsResponse, Error>) -> Void) {
        apiManager.apiCall(for: url) { (result: Result<FilmsResponseApi, Error>) in
            switch result {
            case let .success(peoples):
                completion(.success(peoples))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
