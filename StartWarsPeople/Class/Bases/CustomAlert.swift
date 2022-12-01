//
//  CustomAlert.swift
//  StartWarsPeople
//
//  Created by Santiago Falcon on 1/12/22.
//

import Foundation
import UIKit

protocol ShowAlertProtocol {
    func showAlertView(message: String, parent: UIViewController)
}

struct ShowAlert: ShowAlertProtocol {
    func showAlertView(
        message: String,
        parent: UIViewController
    ) {
        let alertController = UIAlertController(
            title: nil, message: message,
            preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)

        alertController.addAction(button)

        parent.present(alertController, animated: true)
    }
}
