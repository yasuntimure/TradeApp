//
//  BaseReusableButton.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

open class BaseReusableButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeSelf()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeSelf()
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initializeSelf()
    }

    internal func initializeSelf() {
        preconditionFailure("initializeSelf - This method must be overridden")
    }
}
