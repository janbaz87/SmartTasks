//
//  BaseRequest.swift
//  SmartTasks
//
//  Created by Janbaz Ali on 08/06/2024.
//

import Networking

protocol BaseRequest: URLRequestable { }

extension BaseRequest {
    var baseURL: String {
        AppConfiguration.baseURL
    }
}
