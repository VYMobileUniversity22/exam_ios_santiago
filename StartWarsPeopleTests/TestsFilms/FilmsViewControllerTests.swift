//
//  FilmsViewControllerTests.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople
import XCTest

final class FilmsViewControllerTests: XCTestCase{
    var sut: FilmsViewController!
    var presenterMock: FilmsPresenterMock!
    var viewMock: FilmsViewMock!
    
    override func setUp() {
        super.setUp()
        createSut()
    }
    
    override func tearDown() {
        super.tearDown()
        releaseSut()
    }
    
    func createSut(){
        presenterMock = FilmsPresenterMock()
        viewMock = FilmsViewMock()
        
        presenterMock.view = viewMock
        sut = FilmsViewController(presenter: presenterMock)
    }
    
    func releaseSut(){
        sut = nil
        presenterMock = nil
        viewMock = nil
    }
    
    func testGetFilms(){
        _ = sut.view
        XCTAssertTrue(presenterMock.funcGetFilmsCalled)
    }
    
    func numberOfRowsInSection() {
        _ = sut.view
        let tableView = sut.tableViewFilms
        let numSut = sut.tableView(tableView!, numberOfRowsInSection: 1)
        let numTest = presenterMock.getFilmsCount()

        XCTAssertEqual(numSut, numTest)
    }

    func testCellForRowAt() {
        _ = sut.view
        let tableView = sut.tableViewFilms
        let cellSut = sut.tableView(tableView!, cellForRowAt: TestConstants.indexPath) as?
            CustomCellsFilms
        let expectedLabel = "prueba"
        let secondExpectedLabel = "director"
        let thirdExpectedLabel = "123"

        XCTAssertEqual(cellSut?.titleLabelFilms.text, expectedLabel)
        XCTAssertEqual(cellSut?.directorLabelFilms.text, secondExpectedLabel)
        XCTAssertEqual(cellSut?.releaseDateLabelFilms.text, thirdExpectedLabel)
    }
    
}
