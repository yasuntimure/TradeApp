//
//  BaseReusableView.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

open class BaseReusableView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        setNeedsLayout()
        layoutIfNeeded()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
        setNeedsLayout()
        layoutIfNeeded()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initialize()
        setNeedsLayout()
        layoutIfNeeded()
    }

    internal func initialize() {
        preconditionFailure("initializeSelf - This method must be overridden")
    }
}
