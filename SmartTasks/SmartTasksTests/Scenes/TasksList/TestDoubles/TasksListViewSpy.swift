//
//  TasksListViewSpy.swift
//  SmartTasksTests
//
//  Created by Janbaz Ali on 10/06/2024.
//

import Foundation
@testable import SmartTasks

// Mock TasksListView
final class TasksListViewSpy: TasksListView {

    
    var setTitleCount = 0
    var setTitleCalled = false
    var setTasksListDataCalled = false
    var setTasksListDataCalledCount = 0
    var showEmptyViewCalled = false
    var removeTasksListDataCalled = false

    func setTitle(title: String) {
        setTitleCount += 1
        setTitleCalled = true
    }

    func setTasksListData(tasks: [SmartTask]) {
        setTasksListDataCalled = true
        setTasksListDataCalledCount += 1
    }

    func showEmptyView() {
        showEmptyViewCalled = true
    }

    func removeTasksListData() {
        removeTasksListDataCalled = true
    }

    func showErrorAlert(with title: String, message: String) {}
}
