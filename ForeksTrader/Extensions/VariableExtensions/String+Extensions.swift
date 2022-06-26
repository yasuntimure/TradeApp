//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//
import UIKit

extension String {

    var isNotEmpty: Bool {
        return !isEmpty
    }

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    func toDouble() -> Double? {
        // Filters the dot from string
        var dotLessValue = ""
        for letter in self where letter != "." {
            dotLessValue.append(letter)
        }

        // Replaces the comma with dot
        var commaLessValue = ""
        for letter in dotLessValue {
            if letter == "," {
                commaLessValue.append(".")
            } else {
                commaLessValue.append(letter)
            }
        }

        // Rounds price value to 2 digits after comma
        guard var newLastPrice = Double(commaLessValue) else { return nil }
        newLastPrice = floor(newLastPrice * 100) / 100.0
        return newLastPrice
    }
}




