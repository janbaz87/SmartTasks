//
//  TasksListInteractorStub.swift
//  SmartTasksTests
//
//  Created by Janbaz Ali on 10/06/2024.
//

@testable import SmartTasks

// Mock TasksListInteractorInputing
final class TasksListInteractorStub: TasksListInteractorInputing {
    var fetchTasksListCalled = false

    var output: TasksListInteractorOutputing?

    @MainActor func fetchTasksList() {
        fetchTasksListCalled = true
        output?.successfullyFetchedTasks(tasks: [])
    }
}

final class TasksListInteractorWithDataStub: TasksListInteractorInputing {
    var output: TasksListInteractorOutputing?

    @MainActor func fetchTasksList() {
        output?.successfullyFetchedTasks(tasks: Tasks.mock.tasks)
    }
}
