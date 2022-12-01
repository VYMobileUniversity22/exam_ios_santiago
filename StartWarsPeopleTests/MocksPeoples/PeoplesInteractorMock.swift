//
//  PeoplesInteractorMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class PeoplesInteractorMock: PeoplesInteractorProtocol {
    var funcGetPeoplesResult = false
    var showError = false
    
    func getPeoplesResult(url: String, completion: @escaping (Result<StartWarsPeople.PeoplesResponse, Error>) -> Void) {
        funcGetPeoplesResult = true
        if showError {
            completion(.failure(TestConstants.error))
        } else {
            completion(.success(TestConstants.response))
        }
    }
}
