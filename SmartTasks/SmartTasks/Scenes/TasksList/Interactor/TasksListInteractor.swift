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
    func successfullyFetchedTasks(tasks: [SmartTask]?)
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
                output?.successfullyFetchedTasks(tasks: tasks?.tasks)
            case .failure(let error):
                print("api success /n \(error)")
            }
        }
    }
}
