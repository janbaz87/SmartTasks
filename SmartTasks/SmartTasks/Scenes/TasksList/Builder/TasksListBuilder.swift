//
//  TasksListBuilder.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit
import Networking

protocol TasksListBuildable {
    func buildTasksList(router: TasksListRouting) -> TasksListViewController
}

class TasksListBuilder: TasksListBuildable {

    func buildTasksList(router: TasksListRouting) -> TasksListViewController {
        let networking = Networking()
        let interactor = TasksListInteractor(service: TasksService(networking: networking))
        let presenter = TasksListPresenter(
            interactor: interactor,
            router: router
        )
        interactor.output = presenter
        let view = TasksListViewController(presenter: presenter)
        presenter.view = view
        return view
    }
}
