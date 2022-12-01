//
//  PeoplesPresenterTests.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

@testable import StartWarsPeople
import XCTest

class PeoplesPresenterTests: XCTestCase {
    var sut: PeoplesPresenter!
    var interactorMock: PeoplesInteractorMock!
    var viewMock: PeoplesViewMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    func createSut() {
        interactorMock = PeoplesInteractorMock()
        viewMock = PeoplesViewMock()
        sut = PeoplesPresenter(interactor: interactorMock)

        sut.view = viewMock
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func releaseSut() {
        interactorMock = nil
        viewMock = nil
        sut = nil
    }

    func testGetPeoplesSucces() {
        _ = sut.view
        sut.getPeoples()
        XCTAssertTrue(interactorMock.funcGetPeoplesResult)
        XCTAssertTrue(viewMock.funcLoadPeoplesCalled)
    }

    func testGetPeoplesCount() {
        sut.peoples = TestConstants.peoples
        let count = sut.getPeoplesCount()
        let expected = 1
        XCTAssertEqual(count, expected)
    }

    func testGetPeoplesAtIndex() {
        sut.getPeoples()
        let result = sut.peoplesAtIndex(index: 0)
        XCTAssertEqual(result.name, "prueba")
    }

    func testGetNextPage() {
        sut.hasNextPage = true
        let count = sut.getNextPage()
        XCTAssertTrue(count)
    }
}
