//
//  PeoplesCoordinator.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit
class PeoplesCoordinator: PeoplesCoordinatorDelegate {
    func goToDetailScreen(people: PeoplesSW, sender: UIViewController) {
        let interactor = FilmsInteractor(people: people)
        let presenter = FilmsPresenter(interactor: interactor)
        let view = FilmsViewController(presenter: presenter)

        presenter.view = view

        sender.navigationController?.show(view, sender: nil)
    }
}
