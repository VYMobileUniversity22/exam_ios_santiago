//
//  PeoplesServiceApiTests.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople
import XCTest

final class PeoplesServiceApiTests: XCTestCase {
    var sut: PeoplesServiceApi!
    var apiManagerMock: ApiManagerMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        apiManagerMock = ApiManagerMock()
        sut = PeoplesServiceApi(apiManager: apiManagerMock)
    }

    func releaseSut() {
        sut = nil
        apiManagerMock = nil
    }

    func testSutInstNil() {
        XCTAssertNotNil(sut)
    }

    func testGetPeoplesResultSucces() {
        sut.getPeoplesResult(url: "http") { (_: Result<PeoplesResponse, Error>) in

            XCTAssertTrue(self.apiManagerMock.apiCallWasCalled)
            XCTAssertTrue(self.apiManagerMock.getPeoplesWithSuccessWasCalled)
            XCTAssertFalse(self.apiManagerMock.getPeoplesWithErrorWasCalled)
        }
    }

    func testGetPeoplesResultError() {
        apiManagerMock.showError = true
        sut.getPeoplesResult(url: "http") { (_: Result<PeoplesResponse, Error>) in

            XCTAssertTrue(self.apiManagerMock.apiCallWasCalled)
            XCTAssertFalse(self.apiManagerMock.getPeoplesWithSuccessWasCalled)
            XCTAssertTrue(self.apiManagerMock.getPeoplesWithErrorWasCalled)
        }
    }
}
