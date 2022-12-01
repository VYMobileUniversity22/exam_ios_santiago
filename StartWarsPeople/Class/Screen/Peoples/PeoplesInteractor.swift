//
//  PeoplesInteractor.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
internal final class PeoplesInteractor {
    private let peoplesService: PeoplesServiceProtocol

    init(peoplesService: PeoplesServiceProtocol = PeoplesService()) {
        self.peoplesService = peoplesService
    }
}

extension PeoplesInteractor: PeoplesInteractorProtocol {
    func getPeoplesResult(url: String, completion: @escaping (Result<PeoplesResponse, Error>) -> Void) {
        let peoplesService = self.peoplesService.getPeoplesService()

        peoplesService.getPeoplesResult(url: url) { result in
            completion(result)
        }
    }
}
