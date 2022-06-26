//
//  ViewController.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//
import Moya

final class HomeViewModelFactory: ViewModelFactory {

    typealias Target = SettingsService
    typealias Repository = SettingsRepository
    typealias ViewModel = HomeViewModel

    class func makeProvider() -> MoyaProvider<Target> {
        return createMoyaProvider(targetType: Target.self)
    }

    class func makeRepository() -> Repository {
        return Repository(mProvider: makeProvider())
    }

    class func makeViewModel() -> HomeViewModel {
        return HomeViewModel(repository: makeRepository())
    }

}
