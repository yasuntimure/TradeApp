//
//  Definitions.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//

import Foundation
import Moya

// MARK: Response Type
typealias APIResponseCallBack<ResponseType: Codable> = ((MyResult<ResponseType>) -> Void)

// MARK: RequestHeaders
typealias APIRequestHeaders = [String: String]

// MARK: RequestParameters
typealias APIRequestParameters = [String: Any]
typealias APIRequestStringParameters = [String]

// MARK: Typealiases
typealias MoyaMethod = Moya.Method
typealias MoyaTask = Task

// MARK: Definitions
let DefaultJSONEncoding = JSONEncoding.default
let DefaultURLEncoding = URLEncoding.default

// MARK: TargetType - Header
public protocol MTargetType: TargetType { }

extension MTargetType {

    var baseURL: URL {
        return URL(string: NetworkUtil.environmentBaseURL)!
    }

    // application/x-www-form-urlencoded
    public var headers: [String: String]? {
        let headers: [String: String] = ["Content-Type": "application/json; charset=utf-8"]
        return headers
    }

    var sampleData: Data {
        return Data()
    }

}
