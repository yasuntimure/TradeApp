//
//  PrimaryTitleLabel.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

class PrimaryTitleLabel: UILabel {

    var fontSize: CGFloat? {
        didSet {
            self.font = UIFont.boldSystemFont(ofSize: fontSize ?? 28)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initUI()
    }

    private func initUI() {
        self.font = UIFont.boldSystemFont(ofSize: 28)
        self.textColor = .black
    }
}
