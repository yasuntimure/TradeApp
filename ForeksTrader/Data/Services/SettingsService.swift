//
//  SearchService.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//

import Foundation
import Moya

enum SettingsService {
    case getForeksInterviewSettings
    case getForeksInterview(parameters: APIRequestParameters)
}

extension SettingsService: MTargetType {

    var path: String {
        switch self {
        case .getForeksInterviewSettings:
            return "/default/ForeksMobileInterviewSettings"
        case .getForeksInterview(_):
            return "/default/ForeksMobileInterview"
        }
    }

    var method: MoyaMethod {
        switch self {
        case .getForeksInterviewSettings:
            return .get
        case .getForeksInterview(_):
            return .get
        }
    }

    var task: MoyaTask {
        switch self {
        case .getForeksInterviewSettings:
            return .requestPlain
        case .getForeksInterview(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }

}

