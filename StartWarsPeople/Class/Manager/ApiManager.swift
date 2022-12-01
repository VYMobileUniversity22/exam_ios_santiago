//
//  ApiManager.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation

protocol ApiManagerProtocol {
    func apiCall<T: Decodable>(for url: String, completion: @escaping (Result<T, Error>) -> Void)
}

struct ApiManager: ApiManagerProtocol {
    static let shared = ApiManager()

    func apiCall<T: Decodable>(for url: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(
                .failure(
                    CustomError(description: "cualquier cosa", code: 0)
                )
            )
            return
        }
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }
            if let data {
                do {
                    let object = try JSONDecoder()
                        .decode(T.self,
                                from: data)
                    completion(.success(object))
                } catch let decodeError {
                    completion(.failure(decodeError))
                }
            }
        }.resume()
    }
}
