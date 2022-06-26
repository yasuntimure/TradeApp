//
//  BaseTableViewCell.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    static let abcHeight: CGFloat = 100
    
    class var reuseIdentifier: String {
        return "\(self)"
    }

    class var nibInstance: UINib {
        return .init(nibName: "\(self)", bundle: nil)
    }

    class var defaultHeight: CGFloat {
        return UITableView.automaticDimension
    }
}




