//
//  PeoplesServiceApi.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
public class PeoplesServiceApi: PeoplesServiceContract {
    var apiManager: ApiManagerProtocol

    init(apiManager: ApiManagerProtocol = ApiManager()) {
        self.apiManager = apiManager
    }

    func getPeoplesResult(url: String, completion: @escaping (Result<PeoplesResponse, Error>) -> Void) {
        apiManager.apiCall(for: url) { (result: Result<PeoplesResponseApi, Error>) in
            switch result {
            case let .success(peoples):
                completion(.success(peoples))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
