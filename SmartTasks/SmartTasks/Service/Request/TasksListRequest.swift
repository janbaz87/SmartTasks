//
//  TasksListRequest.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import Networking

struct TasksListRequest: BaseRequest {
    var method: HTTPMethod = .get
    var path: String
    var parameters: Encodable?
}
