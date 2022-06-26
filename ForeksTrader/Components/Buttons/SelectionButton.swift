//
//  SecondaryButton.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

class SelectionButton: BaseReusableButton {

    private var defaultBackgroundColor = UIColor.white
    private let cornerRadius = 14
    private let titleColor =  UIColor.black
    private let font = UIFont.boldSystemFont(ofSize: 13)

    override var isHighlighted: Bool {
        didSet {
            backgroundColor =
            isHighlighted ? defaultBackgroundColor.darker(by: 5) : defaultBackgroundColor
        }
    }

    override func initializeSelf() {
        setTitleColorWithFont()
        backgroundColor = defaultBackgroundColor
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = CGFloat(cornerRadius)
    }

}

extension SelectionButton {

    func setTitleColorWithFont() {
        setTitleColor(titleColor, for: .normal)
        tintColor = titleColor
        titleLabel?.font = font
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
