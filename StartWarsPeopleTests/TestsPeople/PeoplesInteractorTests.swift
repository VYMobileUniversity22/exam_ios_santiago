//
//  PeoplesInteractorTests.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

@testable import StartWarsPeople
import XCTest

class PeoplesInteractorTests: XCTestCase {
    var sut: PeoplesInteractor!
    var serviceMock: PeoplesServiceMock!
    var presenterMock: PeoplesPresenterMock!

    override func setUp() {
        createSut()
    }

    func createSut() {
        serviceMock = PeoplesServiceMock()
        presenterMock = PeoplesPresenterMock()
        sut = PeoplesInteractor(peoplesService: serviceMock)
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func releaseSut() {
        serviceMock = nil
        presenterMock = nil
        sut = nil
    }

    func testGetPeoplesResult() {
        sut.getPeoplesResult(url: "http") { _ in
            XCTAssertEqual(self.serviceMock.getPeoplesServiceWasCalled, true)
        }
    }
}
