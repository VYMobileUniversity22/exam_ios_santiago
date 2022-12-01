//
//  PeoplesViewControllerTests.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople
import XCTest

final class PeoplesViewControllerTests: XCTestCase {
    var sut: PeoplesViewController!
    var presenterMock: PeoplesPresenterMock!
    var viewMock: PeoplesViewMock!

    override func setUp() {
        super.setUp()
        createSut()
    }

    override func tearDown() {
        super.tearDown()
        releaseSut()
    }

    func createSut() {
        presenterMock = PeoplesPresenterMock()
        viewMock = PeoplesViewMock()

        presenterMock.view = viewMock
        sut = PeoplesViewController(presenter: presenterMock)
    }

    func releaseSut() {
        sut = nil
        presenterMock = nil
        viewMock = nil
    }

    func testGetPeoples() {
        _ = sut.view
        XCTAssertTrue(presenterMock.funcGetPeoplesCalled)
    }

    func testNumberOfItemsInsection() {
        _ = sut.view
        let collectionView = sut.collectionViewPeoples
        let numSut = sut.collectionView(collectionView!, numberOfItemsInSection: 1)
        let numTest = presenterMock.getPeoplesCount()

        XCTAssertEqual(numSut, numTest)
    }

    func testCellForItemAt() {
        _ = sut.view
        let collectionView = sut.collectionViewPeoples
        let cellSut = sut.collectionView(collectionView!, cellForItemAt: TestConstants.indexPath) as?
            CustomCellsPeoples
        let expectedLabel = "prueba"
        let secondExpectedLabel = "1234"

        XCTAssertEqual(cellSut?.nameLabel.text, expectedLabel)
        XCTAssertEqual(cellSut?.birthYearLabel.text, secondExpectedLabel)
    }

    func testDidSelectItemAt() {
        _ = sut.view
        let collectionView = sut.collectionViewPeoples
        sut.collectionView(collectionView!, didSelectItemAt: TestConstants.indexPath)
        XCTAssertTrue(presenterMock.funcPeoplesAtIndexCalled)
    }

    func testWillDisplay() {
        _ = sut.view
        let collectionView = sut.collectionViewPeoples

        sut.collectionView(collectionView!, willDisplay: TestConstants.testCell, forItemAt: TestConstants.indexPath)
        XCTAssertTrue(presenterMock.funcGetPeoplesCountWasCalled)
    }
}
