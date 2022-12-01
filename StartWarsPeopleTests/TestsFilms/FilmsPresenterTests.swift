//
//  FilmsPresenterTests.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople
import XCTest

class FilmsPresenterTests: XCTestCase {
    var sut: FilmsPresenter!
    var interactorMock: FilmsInteractorMock!
    var viewMock: FilmsViewMock!
    
    override func setUp() {
        super.setUp()
        createSut()
    }
    
    func createSut(){
        interactorMock = FilmsInteractorMock()
        viewMock = FilmsViewMock()
        sut = FilmsPresenter(interactor: interactorMock)
        
        sut.view = viewMock
    }
    
    override func tearDown() {
        super.tearDown()
        releaseSut()
    }
    
    func releaseSut(){
        interactorMock = nil
        viewMock = nil
        sut = nil
    }
    
    func testGetFilmsSucces(){
        _ = sut.view
        sut.getFilms()
        XCTAssertTrue(interactorMock.funcGetFilmsResult)
        XCTAssertTrue(viewMock.funcLoadFilmsCalled)
    }
    
    func testGetFilmsCount(){
        sut.films = TestConstants.films
        let count = sut.getFilmsCount()
        let expected = 1
        XCTAssertEqual(count, expected)
    }
    
    func testGetPeoplesAtIndex(){
        sut.getFilms()
        let result = sut.filmsAtIndex(index: 0)
        XCTAssertEqual(result.title, "prueba")
    }
    
    func testGetPeople(){
        sut.interactor.getFilms()
        XCTAssertTrue(interactorMock.funcGetFilmsCalled)

    }
}
