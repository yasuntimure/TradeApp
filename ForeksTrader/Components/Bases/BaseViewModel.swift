//
//  BaseViewModel.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import Foundation

protocol IBaseViewModel { }

protocol BaseViewModelDelegate: Any {
    func showLoading()
    func hideLoading()
    func showErrorMessage(message: String)
}
