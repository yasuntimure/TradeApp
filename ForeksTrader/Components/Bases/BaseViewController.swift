//
//  BaseViewController.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//
import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialComponents()
        self.registerEvents()
    }

    func initialComponents() { }

    func registerEvents() { }

}



