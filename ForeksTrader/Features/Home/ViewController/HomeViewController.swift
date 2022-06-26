//
//  HomeViewController.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet weak var titleLabel: PrimaryTitleLabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var dropDownButton1: UIButton!
    @IBOutlet weak var dropDownButton2: UIButton!
    @IBOutlet weak var tradeTableView: UITableView!

    let transparentView = UIView()
    let dropDownTableView = UITableView()
    var selectedButton = UIButton()
    var timer = Timer()

    let viewModel = HomeViewModelFactory.makeViewModel()
    var headerFields = ["las", "pdd"]

    var errorMessage: String = "" {
        didSet {
            showAlert(message: errorMessage)
        }
    }

    var settingsResponse: SettingsResponseModel? {
        didSet {
            fetchUpdatedValues()
            tradeTableView.reloadData()
        }
    }

    var liveData: [LCodes] = [] {
        didSet {
            tradeTableView.reloadData()
        }
    }

    var fields: [String] = []
    var stcs: [String] = []
    var dropDownData: [String] = []
    var dropDownKey: [String] = []

    override func initialComponents() {
        viewModel.owned = self
        viewModel.fetchInterviewSettings()
        tradeTableView.registerCell(TradeValueTableViewCell.self)
        setDropDownTableView()
    }

    override func registerEvents() {
        // Header Button 1 Action
        dropDownButton1.onTap { [unowned self] _ in
            let longestString = Helper.longestString(from: dropDownData)
            let width = longestString.widthOfString(usingFont: .boldSystemFont(ofSize: 15)) + 34
            self.selectedButton = self.dropDownButton1
            let frame = CGRect(x: self.dropDownButton1.frame.maxX - width,
                               y: self.dropDownButton1.frame.minY,
                               width: width,
                               height: self.dropDownButton1.frame.height)
            self.addTransparentView(frames: frame)
        }

        // Header Button 2 Action
        dropDownButton2.onTap { [unowned self] _ in
            let longestString = Helper.longestString(from: dropDownData)
            let width = longestString.widthOfString(usingFont: .boldSystemFont(ofSize: 15)) + 34
            self.selectedButton = self.dropDownButton2
            let frame = CGRect(x: self.dropDownButton2.frame.maxX - width,
                               y: self.dropDownButton2.frame.minY,
                               width: width,
                               height: self.dropDownButton2.frame.height)
            self.addTransparentView(frames: frame)
        }

        // Timer Schedule
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            self?.fetchUpdatedValues()
        })
    }

    private func fetchUpdatedValues() {
        viewModel.fetchLiveData(fields: fields, stcs: stcs)
    }

    private func setDropDownTableView() {
        dropDownTableView.delegate = self
        dropDownTableView.dataSource = self
        dropDownTableView.registerCell(DropDownTableViewCell.self)
        dropDownTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    private func addTransparentView(frames: CGRect) {
        transparentView.frame = self.view.frame
        self.view.addSubview(transparentView)

        dropDownTableView.frame = CGRect(x: frames.origin.x,
                                         y: frames.origin.y + frames.height,
                                         width: frames.width,
                                         height: 0)
        self.view.addSubview(dropDownTableView)
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        dropDownTableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.dropDownTableView.layer.cornerRadius = 14
            self.dropDownTableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dropDownData.count * 50))
        }, completion: nil)
    }

    @objc func removeTransparentView() {
        let frames = selectedButton.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.dropDownTableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }

}

