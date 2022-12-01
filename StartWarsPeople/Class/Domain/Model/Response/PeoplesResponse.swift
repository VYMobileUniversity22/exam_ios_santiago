//
//  PeoplesResponse.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
protocol PeoplesResponse {
    var count: Int { get }
    var next: String? { get }
    var previous: String? { get }
    var results: [PeoplesSW] { get }
}
