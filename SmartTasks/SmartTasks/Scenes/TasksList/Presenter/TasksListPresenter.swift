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
            self.reloadUI(for: self.currentDate)
        }
    }
}

// MARK: - Private
private extension TasksListPresenter {
    func fetchTasksList() {
        interactor.fetchTasksList()
    }

    private func nextDate(from dates: [Date], currentDate: Date) -> Date? {
        let currentDate = currentDate
        let futureDates = dates.filter { $0 > currentDate }
        let sortedFutureDates = futureDates.sorted()
        return sortedFutureDates.first
    }

    private func previousDate(from dates: [Date], currentDate: Date) -> Date? {
        let currentDate = currentDate
        let futureDates = dates.filter { $0 < currentDate }
        let sortedFutureDates = futureDates.sorted()
        return sortedFutureDates.last
    }

    private func updateTitleWith(date: Date) {
        view?.setTitle(title: date.getFormattedDateString())
    }

    private func reloadUI(for date: Date) {
        updateTitleWith(date: currentDate)
        if let tasks = self.tasksFor(date: date) {
            view?.setTasksListData(tasks: tasks)
        } else {
            view?.setTasksListData(tasks: [])
            view?.showEmptyView()
        }
    }
}


