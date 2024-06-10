//
//  TasksListResponse.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import Foundation

struct TasksListResponse: Codable {
    let tasks: [TaskResponse]

    static var mock: TasksListResponse {
        TasksListResponse(tasks: TaskResponse.mocks)
    }

    static var emptyMock: TasksListResponse {
        TasksListResponse(tasks: TaskResponse.emptyMocks)
    }
}

struct TaskResponse: Codable {
    let id: String
    let dueDate: String?
    let description: String
    let title: String
    let priority: Int?
    let targetDate: String

    enum CodingKeys: String, CodingKey {
        case id
        case dueDate = "DueDate"
        case description = "Description"
        case title = "Title"
        case priority = "Priority"
        case targetDate = "TargetDate"
    }

    static var emptyMocks: [TaskResponse] {
        []
    }

    static var mocks: [TaskResponse] {
        [
            TaskResponse(
                id: "34",
                dueDate: "2024-08-14",
                description: "Update Android SDK to the latest version. More info at https://developer.android.com/studiointroupdate",
                title: "SDK update",
                priority: 3,
                targetDate: "2024-06-10"
            ),
            TaskResponse(
                id: "35",
                dueDate: "2024-07-14",
                description: "Update Android SDK to the latest version. More info at https://developer.android.com/studiointroupdate",
                title: "SDK update",
                priority: 3,
                targetDate: "2024-06-11"
            )
        ]
    }
}
