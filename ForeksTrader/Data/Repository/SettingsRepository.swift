//
//  SearchRepository.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//
import Moya

protocol ISettingsRepository {
    func getInterviewSettings(callback: @escaping APIResponseCallBack<SettingsResponseModel>)
    func getUpdatedValues(parameters: UpdatedValuesRequestModel, callback: @escaping APIResponseCallBack<ForeksInterviewResponseModel>)
}


class SettingsRepository: BaseRepository<SettingsService>, ISettingsRepository {

    init(mProvider: MoyaProvider<SettingsService>) {
        super.init(provider: mProvider)
    }

    func getInterviewSettings(callback: @escaping APIResponseCallBack<SettingsResponseModel>) {
        self.mRequest(.getForeksInterviewSettings, callback: callback)
    }

    func getUpdatedValues(parameters: UpdatedValuesRequestModel, callback: @escaping APIResponseCallBack<ForeksInterviewResponseModel>) {
        self.mRequest(.getForeksInterview(parameters: parameters.generateAPIRequestParameters()), callback: callback)
    }
}

