//
//  TasksListPresenter.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListPresentation {}

class TasksListPresenter: TasksListPresentation {

    // MARK: - Init
    init (
        interactor: TasksListInteractorInputing,
        router: TasksListRouting
    ) {
        self.interactor = interactor
        self.router = router
    }

    // MARK: - Internal
    weak var view: TasksListView?

    // MARK: - Private
    private let interactor: TasksListInteractorInputing
    private let router: TasksListRouting
}

extension TasksListPresenter: TasksListInteractorOutputing {}
