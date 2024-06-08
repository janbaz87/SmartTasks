//
//  TasksListPresenter.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListPresentation {
    func viewDidLoad()
}

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

    func viewDidLoad() {
        fetchTasksList()
    }
}

// MARK: - TasksListInteractorOutputing
extension TasksListPresenter: TasksListInteractorOutputing {
    @MainActor
    func successfullyFetchedTasks(tasks: Tasks?) {
        guard let tasks = tasks else { return }
        print(tasks)
    }
}

// MARK: - Private
private extension TasksListPresenter {
    func fetchTasksList() {
        interactor.fetchTasksList()
    }
}


