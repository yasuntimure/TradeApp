//
//  UpdateValuesResponseModel.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//

import Foundation

// MARK: - UpdatedValuesResponseModel
struct ForeksInterviewResponseModel: Codable {
    let l: [LCodes]?
    let z: String?
}

// MARK: - LCodes
struct LCodes: Codable, Comparable {
    static func < (lhs: LCodes, rhs: LCodes) -> Bool {
        if lhs.clo == rhs.clo // &&
//            lhs.tke == rhs.tke &&
//            lhs.las == rhs.las &&
//            lhs.pdd == rhs.pdd &&
//            lhs.ddi == rhs.ddi &&
//            lhs.low == rhs.low &&
//            lhs.hig == rhs.hig &&
//            lhs.buy == rhs.buy &&
//            lhs.sel == rhs.sel &&
//            lhs.pdc == rhs.pdc &&
//            lhs.cei == rhs.cei &&
//            lhs.flo == rhs.flo &&
//            lhs.gco == rhs.gco
        {
            return true
        } else {
            return false
        }
    }

    let tke, clo, las, pdd, ddi, low, hig, buy, sel, pdc, cei, flo, gco: String?
}
