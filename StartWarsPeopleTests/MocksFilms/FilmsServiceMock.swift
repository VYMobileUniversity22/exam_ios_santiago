//
//  FilmsServiceMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class FilmsServiceMock: FilmsServiceProtocol {
    var getFilmsServiceWasCalled = false

    
    func getFilmsService() -> StartWarsPeople.FilmsServiceContract {
        getFilmsServiceWasCalled = true
        return FilmsServiceApiMock()
    }
    
    
}
