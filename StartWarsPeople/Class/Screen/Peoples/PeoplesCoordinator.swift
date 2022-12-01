//
//  PeoplesCoordinator.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit
class PeoplesCoordinator: PeoplesCoordinatorDelegate {
    func goToDetailScreen(sender: UIViewController) {
        let interactor = PeoplesInteractor()
        let presenter = PeoplesPresenter(interactor: interactor)
        let view = PeoplesViewController(presenter: presenter)

        presenter.view = view

        sender.navigationController?.show(view, sender: nil)
    }
}
