//
//  PeoplesServiceMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class PeoplesServiceMock: PeoplesServiceProtocol {
    var getPeoplesServiceWasCalled = false

    func getPeoplesService() -> StartWarsPeople.PeoplesServiceContract {
        getPeoplesServiceWasCalled = true
        return PeoplesServiceApiMock()
    }
}
