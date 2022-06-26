//
//  CellData.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import Foundation

struct CellData {
    let codes: [LCodes]?
    let fields: [String]
    let index: Int
}

enum Fields: String {
    case las = "las"
    case pdd = "pdd"
    case ddi = "ddi"
    case low = "low"
    case hig = "hig"
    case buy = "buy"
    case sel = "sel"
    case pdc = "pdc"
    case cei = "cei"
    case flo = "flo"
    case gco = "gco"
}

enum AssetImageType: String {
    case upArrow
    case downArrow
    case none
}
