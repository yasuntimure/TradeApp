//
//  BaseCollectionReusableView.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

class BaseCollectionReusableView: UICollectionReusableView {

    class var reuseIdentifier: String {
        return "\(self)"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func initializeView() { }

}

class BaseCollectionViewCell: UICollectionViewCell {

    class var reuseIdentifier: String {
        return "\(self)"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func initializeCell() { }

}
