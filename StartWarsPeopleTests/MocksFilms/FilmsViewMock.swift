//
//  FilmsViewMock.swift
//  StartWarsPeopleTests
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
@testable import StartWarsPeople

class FilmsViewMock: FilmsViewProtocol {
    var funcLoadFilmsCalled = false
    var funcShowErrorCalled = false

    var funcLoadIndicatorCalled = false
    var funcLoadBoolWasCalled = false
    var funcNotLoadBollWasCalled = false

    func loadFilms() {
        funcLoadFilmsCalled = true
    }

    func showError(message: String) {
        funcShowErrorCalled = true
    }

    func loadIndicator(indicatorBool: Bool) {
        funcLoadIndicatorCalled = true
        if indicatorBool {
            funcLoadBoolWasCalled = true
        } else {
            funcNotLoadBollWasCalled = true
        }
    }
}
