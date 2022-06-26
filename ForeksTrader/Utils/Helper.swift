//
//  Helper.swift
//  ForeksTrader
//
//  Created by Eyüp on 22.06.2022.
//

import Foundation

class Helper {
    class func longestString<T:Sequence>(from stringsArray: T) -> String where T.Iterator.Element == String {
        return (stringsArray.max { $0.count < $1.count }) ?? ""
    }
}
