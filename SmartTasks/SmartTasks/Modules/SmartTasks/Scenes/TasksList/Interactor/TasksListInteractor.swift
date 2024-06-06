//
//  TasksListInteractor.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 07/06/2024.
//

import UIKit

protocol TasksListInteractorInputing {}
protocol TasksListInteractorOutputing: AnyObject {}

class TasksListInteractor: TasksListInteractorInputing {

    // MARK: - Init
    init() {
    }

    // MARK: - Internal
    weak var output: TasksListInteractorOutputing?
}
