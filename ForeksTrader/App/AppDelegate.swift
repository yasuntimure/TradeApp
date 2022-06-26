//
//  AppDelegate.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startAlamofireNetworkLogger()
        return true
    }

}

// MARK: Init
extension AppDelegate {

    func startAlamofireNetworkLogger() {
        AlamofireNetworkLogger.shared.startLogging()
        AlamofireNetworkLogger.shared.level = .debug
    }

    func changeRootViewController(viewController: UIViewController) {
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }

}

