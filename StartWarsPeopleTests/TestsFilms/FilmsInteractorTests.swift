//
//  FilmsInteractorTests.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

@testable import StartWarsPeople
import XCTest

class FilmsInteractorTests: XCTestCase {
    var sut: FilmsInteractor!
    var serviceMock: FilmsServiceMock!
    var presenterMock: FilmsPresenterMock!
    
    override func setUp() {
        createSut()
    }
    
    func createSut(){
        serviceMock = FilmsServiceMock()
        presenterMock = FilmsPresenterMock()
        sut = FilmsInteractor(people: TestConstants.people, filmsService: serviceMock)
    }
    
    override func tearDown() {
        super.tearDown()
        releaseSut()
    }
    
    func releaseSut(){
        serviceMock = nil
        presenterMock = nil
        sut = nil
    }
    
    func testGetFilmsResult() {
        sut.getFilmsResult(url: "http") { _ in
            XCTAssertEqual(self.serviceMock.getFilmsServiceWasCalled, true)
        }
    }
}
