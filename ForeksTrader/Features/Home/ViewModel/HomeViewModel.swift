//
//  ViewModel.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import Foundation

class HomeViewModel: IBaseViewModel {

    var errorMessage: String = "" { didSet { owned?.errorMessage = errorMessage } }

    var settingsResponse: SettingsResponseModel? {
        didSet {
            updateDropDownData()
            updateFields()
            updateStcs()
            owned?.settingsResponse = settingsResponse
        }
    }

    var liveDataResponse: [LCodes] = [] { didSet { owned?.liveData = liveDataResponse } }
    var fields: [String] = [] { didSet { owned?.fields = fields } }
    var stcs: [String] = [] { didSet { owned?.stcs = stcs } }
    var dropDownData: [String] = [] { didSet { owned?.dropDownData = dropDownData } }
    var dropDownKey: [String] = [] { didSet { owned?.dropDownKey = dropDownKey } }

    weak var owned: HomeViewController?
    let repository: SettingsRepository

    init(repository: SettingsRepository) {
        self.repository = repository
    }

    func updateDropDownData() {
        guard let mypage = settingsResponse?.mypage else { return }
        for item in mypage {
            if let name = item.name, let key = item.key {
                dropDownData.append(name)
                dropDownKey.append(key)
            }
        }
    }

    func updateFields() {
        guard let mypage = settingsResponse?.mypage else { return }
        for item in mypage {
            if let key = item.key {
                fields.append(key)
            }
        }
    }

    func updateStcs() {
        guard let mydefaults = settingsResponse?.mypageDefaults else { return }
        for item in mydefaults {
            if let tke = item.tke {
                stcs.append(tke)
            }
        }
    }
}

extension HomeViewModel {
    func fetchInterviewSettings() {
        self.repository.getInterviewSettings(callback: { [weak self] requestResponse in
            switch requestResponse {
            case .success(let response):
                self?.settingsResponse = response
            case .failure(let errorType):
                self?.errorMessage = errorType.description
            }
        })
    }

    func fetchLiveData(fields: [String], stcs: [String]) {
        let mFields = fields.joined(separator: ",")
        let mStcs = stcs.joined(separator: "~")
        let parameters = UpdatedValuesRequestModel(fields: mFields, stcs: mStcs)
        self.repository.getUpdatedValues(parameters: parameters) { [weak self] requestResponse in
            switch requestResponse {
            case .success(let response):
                guard let liveData = response.l else { return }
                self?.liveDataResponse = liveData
            case .failure(let errorType):
                self?.errorMessage = errorType.description
            }
        }
    }
}
