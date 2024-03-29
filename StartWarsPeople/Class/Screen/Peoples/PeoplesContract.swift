//
//  PeoplesContract.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit

protocol PeoplesViewProtocol: BaseProtocol {
    func loadPeoples()
    func loadIndicator(indicatorBool: Bool)
}

protocol PeoplesPresenterProtocol {
    var view: PeoplesViewProtocol? { get set }

    func getNextPage() -> Bool

    func getPeoples()
    func getPeoplesCount() -> Int
    func peoplesAtIndex(index: Int) -> PeoplesSW
}

protocol PeoplesInteractorProtocol {
    func getPeoplesResult(url: String, completion: @escaping (Result<PeoplesResponse, Error>) -> Void)
}

protocol PeoplesServiceProtocol {
    func getPeoplesService() -> PeoplesServiceContract
}

protocol PeoplesCoordinatorDelegate {
    func goToDetailScreen(people: PeoplesSW, sender: UIViewController)
}
