//
//  ApiManagerMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

final class ApiManagerMock: ApiManagerProtocol {
    var showError = false
    var apiCallWasCalled = false
    var getPeoplesWithSuccessWasCalled = false
    var getPeoplesWithErrorWasCalled = false
    
    func apiCall<T>(for url: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        apiCallWasCalled = true
        if showError {
            getPeoplesWithErrorWasCalled = true
            completion(.failure(TestConstants.error))
        } else {
            getPeoplesWithSuccessWasCalled = true
            completion(.success(TestConstants.responseApi as! T))
        }
    }
    
    
}
