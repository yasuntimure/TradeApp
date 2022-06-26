//
//  DataManager.swift
//  ForeksTrader
//
//  Created by Eyüp on 26.06.2022.
//

import Foundation

class DataManager {

    static let shared = DataManager()

    private init() { }

    var storedData: [LCodes]?
}
