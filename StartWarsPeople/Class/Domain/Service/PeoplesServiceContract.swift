//
//  PeoplesServiceContract.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
protocol PeoplesServiceContract {
    func getPeoplesResult(url: String, completion: @escaping (Result<PeoplesResponse, Error>) -> Void)
}
