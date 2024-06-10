//
//  TasksListInteractor.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListInteractorInputing {
    func fetchTasksList()
}
protocol TasksListInteractorOutputing: AnyObject {
    @MainActor
    func successfullyFetchedTasks(tasks: [SmartTask]?)
    @MainActor
    func failedToFetchTasks()
}

class TasksListInteractor: TasksListInteractorInputing {

    // MARK: - Init
    init(service: TasksServiceProviding) {
        self.service = service
    }

    // MARK: - Internal
    weak var output: TasksListInteractorOutputing?

    // MARK: - Private
    var service: TasksServiceProviding

    func fetchTasksList()  {
        Task {
            let result = await service.fetchTasksList()

            switch result {
            case .success(let tasks):
                await output?.successfullyFetchedTasks(tasks: tasks?.tasks)
            case .failure(let error):
                await output?.failedToFetchTasks()
                print("api error /n \(error)")
            }
        }
    }
}
