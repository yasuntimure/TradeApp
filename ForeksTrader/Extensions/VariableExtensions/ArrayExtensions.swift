//
//  Array+Extensions.swift
//  LTLMobile
//
//  Created by Eyüp Yasuntimur on 17.09.2021.
//

import Foundation

// This functions makes equatable objects for compparing them.
extension Array where Element: Equatable {

    @discardableResult mutating func remove(object: Element) -> Bool {
        if let index = firstIndex(of: object) {
            self.remove(at: index)
            return true
        }
        return false
    }

    @discardableResult mutating func remove(where predicate: (Array.Iterator.Element) -> Bool) -> Bool {
        if let index = self.firstIndex(where: { (element) -> Bool in
            return predicate(element)
        }) {
            self.remove(at: index)
            return true
        }
        return false
    }

}


extension Array where Element == UInt8 {
    var data: Data {
        return Data(self)
    }
}
