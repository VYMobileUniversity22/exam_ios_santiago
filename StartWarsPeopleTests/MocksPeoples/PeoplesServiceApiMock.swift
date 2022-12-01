//
//  PeoplesServiceApiMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class PeoplesServiceApiMock: PeoplesServiceContract {
    func getPeoplesResult(url: String, completion: @escaping (Result<StartWarsPeople.PeoplesResponse, Error>) -> Void) {
        completion(.success(TestConstants.response))
    }
}
