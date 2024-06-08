//
//  TasksListResponse.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import Foundation

struct TasksListResponse: Codable {
    let tasks: [TaskResponse]

//    static var mock: TasksListResponse {
//        TasksListResponse(tasks: [TaskResponse.mock])
//    }
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

//    static var mock: TaskResponse {
//        TaskResponse(
//            id: "34",
//            dueDate: "2024-08-31",
//            description: "Update Android SDK to the latest version. More info at https://developer.android.com/studiointroupdate",
//            title: "SDK update",
//            priority: 3,
//            targetDate: "2024-08-25"
//        )
//    }
}
