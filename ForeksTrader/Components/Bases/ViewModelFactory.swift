//
//  ViewModelFactory.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import Moya

protocol ViewModelFactory {

    associatedtype Target: TargetType
    associatedtype Repository: IBaseRepository
    associatedtype ViewModel: IBaseViewModel

    static func makeProvider() -> MoyaProvider<Target>
    static func makeRepository() -> Repository
    static func makeViewModel() -> ViewModel
}

extension ViewModelFactory {

    static func createMoyaProvider<Target: TargetType>(targetType: Target.Type) -> MoyaProvider<Target> {
        let provider = MoyaProvider<Target>()
        provider.session.sessionConfiguration.timeoutIntervalForRequest = 120
        return provider
    }

}
