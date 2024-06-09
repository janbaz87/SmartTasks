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

    // MARK: - Lifecycle
    func viewDidLoad() {
        fetchTasksList()
    }

    // MARK: - Internal
    weak var view: TasksListView?

    // MARK: - Private
    private let interactor: TasksListInteractorInputing
    private let router: TasksListRouting
    private var currentDate = Date()
    private var groupedTasks = [Date: [SmartTask]]()

    private func tasksFor(date: Date) -> [SmartTask]? {
        return groupedTasks[date]
    }

    private func groupTasksByDate(tasks: [SmartTask]) {
        for task in tasks {
            let startOfDay = Calendar.current.startOfDay(for: task.targetDate)
            if groupedTasks[startOfDay] == nil {
                groupedTasks[startOfDay] = [SmartTask]()
            }
            groupedTasks[startOfDay]?.append(task)
        }
    }
}

// MARK: - TasksListInteractorOutputing
extension TasksListPresenter: TasksListInteractorOutputing {
    @MainActor
    func successfullyFetchedTasks(tasks: [SmartTask]?) {
        guard let tasks = tasks else { return }
        groupTasksByDate(tasks: tasks)
        DispatchQueue.main.async {
            if let todaysTasks = self.tasksFor(date: self.currentDate) {
                self.view?.setTasksListData(tasks: todaysTasks)
            } else {
                self.view?.showEmptyView()
            }
        }
    }
}

// MARK: - Private
private extension TasksListPresenter {
    func fetchTasksList() {
        interactor.fetchTasksList()
    }
}


