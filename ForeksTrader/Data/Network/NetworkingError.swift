//
//  NetworkingError.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//

import Foundation

enum NetworkingError: CustomStringConvertible {
    case NO_CONNECTION_NETWORK
    case HTTP_EXCEPTION(statusCode: Int, message: String?)
    case UNDEFINED(message: String)
    case UNDEFINED_RESPONSE_TYPE
    case ERROR_MESSAGE(message: String)

    var description: String {
        switch self {
        case .NO_CONNECTION_NETWORK:
            return "Please check your internet connection!"
        case .HTTP_EXCEPTION(let statusCode, let message):
            switch statusCode {
            case 401:
                return "Authorization"
            case 406:
                return "406 Error"
            case 500:
                return "Network Error"
            default:
                return message ?? ""
            }
        case .UNDEFINED(let message):
            return message
        case .UNDEFINED_RESPONSE_TYPE:
            return "Undefined service response"
        case .ERROR_MESSAGE(let message):
            return message
        }
    }
}

enum MyResult<T: Codable> {
    // case empty
    case success(T)
    case failure(errorType: NetworkingError)
}
