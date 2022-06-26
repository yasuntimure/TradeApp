//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import Foundation

internal let ClosureHandlerSelector = Selector(("handle"))

internal class ClosureHandler<T: AnyObject>: NSObject {

    internal var handler: ((T) -> Void)?
    internal weak var control: T?

    internal init(handler: @escaping (T) -> Void, control: T? = nil) {
        self.handler = handler
        self.control = control
    }

    @objc func handle() {
        if let control = self.control {
            handler?(control)
        }
    }
}

