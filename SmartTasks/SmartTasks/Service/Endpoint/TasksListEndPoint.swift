//
//  TasksListEndPoint.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

enum TasksListEndpoint {
    case tasksList
}

extension TasksListEndpoint {
    var path: String {
        switch self {
        case .tasksList:
            return ""
        }
    }
}
