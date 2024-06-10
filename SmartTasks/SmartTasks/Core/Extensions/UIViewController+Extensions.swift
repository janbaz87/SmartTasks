//
//  UIViewController+Extensions.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 10/06/2024.
//
import UIKit

extension UIViewController {

    func showAlert(title: String, message: String, buttonTitle: String = "OK") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(defaultAction)

        self.present(alertController, animated: true, completion: nil)
    }

}
