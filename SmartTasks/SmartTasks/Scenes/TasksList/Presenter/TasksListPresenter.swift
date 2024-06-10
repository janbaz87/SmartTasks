//
//  TasksListPresenter.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListPresentation {
    func viewDidLoad()
    func nextButtonTapped()
    func previousButtonTapped()
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

    func viewDidLoad() {
        fetchTasksList()
    }

    func nextButtonTapped() {
        if let nextDate = nextDate(from: Array(groupedTasks.keys), currentDate: currentDate) {
            currentDate = nextDate
            reloadUI(for: currentDate)
        } else {
            if currentDate < Date() {
                currentDate = Date()
                reloadUI(for: currentDate)
            }
        }
    }

    func previousButtonTapped() {
        if let previousDate = previousDate(from: Array(groupedTasks.keys), currentDate: currentDate) {
            currentDate = previousDate
            reloadUI(for: currentDate)
        } else {
            if currentDate > Date() {
                currentDate = Date()
                reloadUI(for: currentDate)
            }
        }
    }

    // MARK: - Private
    private let interactor: TasksListInteractorInputing
    private let router: TasksListRouting
    private var currentDate = Calendar.current.startOfDay(for: Date())
    private var groupedTasks = [Date: [SmartTask]]()
}

// MARK: - TasksListInteractorOutputing
extension TasksListPresenter: TasksListInteractorOutputing {
    @MainActor
    func failedToFetchTasks() {
        view?.showErrorAlert(with: Constants.Text.appName, message: Constants.Text.errorMessage)
    }
    
    @MainActor
    func successfullyFetchedTasks(tasks: [SmartTask]?) {
        guard let tasks = tasks else { return }
        groupTasksByDate(tasks: tasks)
        reloadUI(for: currentDate)
    }
}

// MARK: - Private
private extension TasksListPresenter {
    func fetchTasksList() {
        interactor.fetchTasksList()
    }

    func nextDate(from dates: [Date], currentDate: Date) -> Date? {
        let currentDate = currentDate
        let futureDates = dates.filter { $0 > currentDate }
        let sortedFutureDates = futureDates.sorted()
        return sortedFutureDates.first
    }

    func previousDate(from dates: [Date], currentDate: Date) -> Date? {
        let currentDate = currentDate
        let futureDates = dates.filter { $0 < currentDate }
        let sortedFutureDates = futureDates.sorted()
        return sortedFutureDates.last
    }

    func updateTitleWith(date: Date) {
        view?.setTitle(title: date.getFormattedDateString())
    }

    func reloadUI(for date: Date) {
        self.updateTitleWith(date: self.currentDate)
        if let tasks = self.tasksFor(date: date) {
            self.view?.setTasksListData(tasks: tasks)
        } else {
            self.view?.removeTasksListData()
            self.view?.showEmptyView()
        }
    }

    func tasksFor(date: Date) -> [SmartTask]? {
        return groupedTasks[date]
    }

    func groupTasksByDate(tasks: [SmartTask]) {
        for task in tasks {
            let startOfDay = Calendar.current.startOfDay(for: task.targetDate)
            if groupedTasks[startOfDay] == nil {
                groupedTasks[startOfDay] = [SmartTask]()
            }
            groupedTasks[startOfDay]?.append(task)
        }
    }
}


