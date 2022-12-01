//
//  PeoplesPresenterMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class PeoplesPresenterMock: PeoplesPresenterProtocol {
    var view: StartWarsPeople.PeoplesViewProtocol?

    var funcGetPeoplesCalled = false
    var funcGetNextPageWasCalled = false
    var funcGetPeoplesCountWasCalled = false
    var funcPeoplesAtIndexCalled = false

    var hasNextPage = true

    func getNextPage() -> Bool {
        funcGetNextPageWasCalled = true
        return hasNextPage
    }

    func getPeoples() {
        funcGetPeoplesCalled = true
    }

    func getPeoplesCount() -> Int {
        funcGetPeoplesCountWasCalled = true
        return TestConstants.peoples.count
    }

    func peoplesAtIndex(index: Int) -> StartWarsPeople.PeoplesSW {
        funcPeoplesAtIndexCalled = true
        return TestConstants.peoples[index]
    }
}
