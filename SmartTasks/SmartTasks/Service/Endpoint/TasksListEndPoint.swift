//
//  TasksListEndPoint.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

enum CurrencyExchangeEndpoint {
    case tasksList
}

extension CurrencyExchangeEndpoint {
    var path: String {
        switch self {
        case .tasksList:
            return ""
        }
    }
}
