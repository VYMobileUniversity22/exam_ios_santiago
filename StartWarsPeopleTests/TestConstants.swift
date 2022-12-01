//
//  TestConstants.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople
import UIKit

struct TestConstants{
    static let indexPath = IndexPath(row: 0, section: 0)
    static let numberOfSections = 0
    static let error = CustomError(description: "errorr", code: 0)
    static let testCell = UICollectionViewCell()
    static let people = PeoplesApiMock(name: "prueba", birthYear: "1234", gender: "male", films: ["hola"])
    static let peoples = [people]
    static let response = PeoplesResponseApiMock(count: 1, next: "1", previous: nil, castresults: peoples)
    static let responseApi = PeoplesResponseApi()
}
