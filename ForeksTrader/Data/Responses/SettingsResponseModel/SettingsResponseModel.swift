//
//  SearchResponseModel.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//

import Foundation

// MARK: - SettingsResponseModel
struct SettingsResponseModel: Codable {
    let mypage: [Mypage]?
    let mypageDefaults: [MypageDefault]?
}

// MARK: - Mypage
struct Mypage: Codable {
    let name, key: String?
}

// MARK: - MypageDefault
struct MypageDefault: Codable {
    let cod, gro, tke, def: String?
}

