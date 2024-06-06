//
//  TasksListBuilder.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListBuildable {
    func buildTasksList(router: TasksListRouting) -> TasksListViewController
}

class TasksListBuilder: TasksListBuildable {

    func buildTasksList(router: TasksListRouting) -> TasksListViewController {
        let interactor = TasksListInteractor()
        let presenter = TasksListPresenter(
            interactor: interactor,
            router: router
        )
        let view = TasksListViewController(presenter: presenter)
        presenter.view = view
        interactor.output = presenter

        return view
    }
}
