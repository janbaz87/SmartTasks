//
//  TasksService.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import Networking

protocol TasksServiceProviding {
    func fetchTasksList() async -> Result<Tasks?, AppError>
}

final class TasksService: TasksServiceProviding {

    private let networking: NetworkProviding

    init(networking: NetworkProviding) {
        self.networking = networking
    }

    func fetchTasksList() async -> Result<Tasks?, AppError> {
        let path = CurrencyExchangeEndpoint.tasksList.path
        let request = TasksListRequest(path: path, parameters: nil)

        let result = await networking.request(
            requestable: request,
            responseType: TasksListResponse.self
        )

        switch result {

        case .success(let tasks):
            print("api success /n \(tasks)")
            let tasks = Tasks(tasksDTO: tasks)
            return .success(tasks)
        case .failure(let error):
            handleError(error: error)
            return .failure(.networkingError)
        }
    }

    private func handleError(error: NetworkError) {
        switch error {
        case .noHTTPResponse:
            print("noHTTPResponse")
        case .clientError:
            print("clientError")
        case .serverError:
            print("serverError")
        case .invalidURL:
            print("invalidURL")
        case .serialization:
            print("serialization failure")
        case .unknown:
            print("api failure")
        }
    }
}
