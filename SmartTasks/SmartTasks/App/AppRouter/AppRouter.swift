//
//  AppRouter.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

final class AppRouter {

    private let window: UIWindow? // Router for the initial VIPER module

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        guard let window = window else { return }
        // TODO: -  Route to the main view
    }

}
