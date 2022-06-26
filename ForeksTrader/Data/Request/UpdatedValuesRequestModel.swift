//
//  UpdatedValuesRequestModel.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//

import Foundation

struct UpdatedValuesRequestModel {

    let fields: String
    let stcs: String

    func generateAPIRequestParameters() -> APIRequestParameters {
        var parameters = APIRequestParameters()
        parameters["fields"] = fields
        parameters["stcs"] = stcs
        return parameters
    }
}
