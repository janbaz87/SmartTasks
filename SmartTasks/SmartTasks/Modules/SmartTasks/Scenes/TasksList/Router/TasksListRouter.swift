//
//  TasksListRouter.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListRouting {
    func showTasksListView(on window: UIWindow)
}

class TasksListRouter: TasksListRouting {

    // MARK: - Private
    private var viewController: UIViewController?
    private var root: UINavigationController?
    private let builer: TasksListBuildable

    // MARK: - Init
    init(
        builder: TasksListBuildable = TasksListBuilder()
    ) {
        self.builer = builder
    }

    // MARK: - Internal
    func showTasksListView(on window: UIWindow) {
        viewController = builer.buildTasksList(router: self)
        guard let viewController = viewController else { return }
        root = UINavigationController(rootViewController: viewController)
        window.rootViewController = root
        window.makeKeyAndVisible()
    }
}
