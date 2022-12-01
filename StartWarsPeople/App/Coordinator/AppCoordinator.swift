//
//  AppCoordinator.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var window: UIWindow

    lazy var navigationController: UINavigationController = {
        getNavigation()
    }()

    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }

    private func getNavigation() -> UINavigationController {
        let navigator = UINavigationController()

        return navigator
    }

    func start() {
        showHome()
    }

    func showHome() {
        let coordinator = PeoplesCoordinator()
        let interactor = PeoplesInteractor()
        let presenter = PeoplesPresenter(interactor: interactor)
        let view = PeoplesViewController(presenter: presenter)

        view.delegate = coordinator
        presenter.view = view

        navigationController.setViewControllers([view], animated: true)
    }
}
