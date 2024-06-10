//
//  Tasks.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import Foundation

struct SmartTask: Hashable {
    let id: String
    let dueDate: Date?
    let description: String
    let title: String
    let priority: Int
    let targetDate: Date

    // MARK: - Init
    init(taskDTO: TaskResponse ) {
        self.id = taskDTO.id
        self.description = taskDTO.description
        self.title = taskDTO.title
        self.priority = taskDTO.priority ?? 0

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        self.dueDate = dateFormatter.date(from: taskDTO.dueDate ?? String.empty)

        if let date = dateFormatter.date(from: taskDTO.targetDate) {
            self.targetDate = date
        } else {
            let veryLargeDate = Date(timeIntervalSince1970: 253402300799)
            self.targetDate = veryLargeDate
        }

    }

    // MARK: - Hashable
    static func == (lhs: SmartTask, rhs: SmartTask) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

}

struct Tasks {
    var tasks: [SmartTask] = []

    static var mock: Tasks {
        Tasks(tasksDTO: TasksListResponse.mock)
    }

    static var emptyMock: Tasks {
        Tasks(tasksDTO: TasksListResponse.emptyMock)
    }

    // MARK: - Init
    init(tasksDTO: TasksListResponse) {
        for taskDTO in tasksDTO.tasks {
            let task = SmartTask(taskDTO: taskDTO)
            tasks.append(task)
        }

        let sortedTasks = tasks.sorted {
            if $0.targetDate != $1.targetDate {
                return $0.targetDate < $1.targetDate
            } else {
                return $0.priority > $1.priority
            }
        }
        tasks = sortedTasks
    }
}
