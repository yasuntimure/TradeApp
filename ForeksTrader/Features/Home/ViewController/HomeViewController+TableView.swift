//
//  HomeViewController+TableView.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tradeTableView {
            return liveData.count
        } else {
            return dropDownData.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tradeTableView {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as TradeValueTableViewCell
            cell.cellData = CellData(codes: liveData, fields: headerFields, index: indexPath.row)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as DropDownTableViewCell
            cell.label.text = dropDownData[indexPath.row]
            return cell
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == dropDownTableView {
            let title = dropDownData[indexPath.row]
            let key = dropDownKey[indexPath.row]
            selectedButton.setTitle(title, for: .normal)
            removeTransparentView()
            if selectedButton == dropDownButton1 {
                headerFields[0] = key
            } else {
                headerFields[1] = key
            }
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == dropDownTableView {
            return 50
        } else {
            return 60
        }
    }
}
