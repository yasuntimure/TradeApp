//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

extension UILabel {

    func makeStrikeThrough(_ color: UIColor) {
        guard let text = self.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                        NSAttributedString.Key.strikethroughColor: color],
                                       range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
    
}
