//
//  PeoplesService.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
internal final class PeoplesService: PeoplesServiceProtocol {
    private let peoplesService: PeoplesServiceContract

    init(peoplesService: PeoplesServiceContract = PeoplesServiceApi()) {
        self.peoplesService = peoplesService
    }

    func getPeoplesService() -> PeoplesServiceContract {
        return peoplesService
    }
}
