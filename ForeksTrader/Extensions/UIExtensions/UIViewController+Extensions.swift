//  ForeksTrader
//
//  Created by Eyüp Yasuntimur on 25.06.2022.
//

import UIKit

extension UIViewController {

    var appDelegate: AppDelegate {
        get {
            return UIApplication.shared.delegate as! AppDelegate
        }
    }

    func openUrl(url: String) {
        if let url = URL(string: url) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }

    func presentViewController(_ viewControllerToPresent: UIViewController) {
        self.present(viewControllerToPresent, animated: true, completion: nil)
    }

    func pushViewController(_ viewControllerToPresent: UIViewController, isAnimated: Bool = true) {
        self.navigationController?.pushViewController(viewControllerToPresent, animated: isAnimated)
    }

    func selfDismiss() {
        self.dismiss(animated: true, completion: nil)
    }

    func selfPopViewController() {
        self.navigationController?.popViewController(animated: true)
    }

    func selfPopToRootViewController(animated: Bool = false) {
        self.navigationController?.popToRootViewController(animated: animated)
    }

}

// MARK: Alert
extension UIViewController {

    func showAlert(
        message: String,
        positiveButtonText: String? = "Tamam",
        _ positiveButtonClickListener: (() -> Void)? = nil,
        negativeButtonText: String? = nil,
        _ negativeButtonClickListener: (() -> Void)? = nil,
        cancelButtonText: String? = nil,
        _ cancelButtonClickListener: (() -> Void)? = nil) {
        showSystemAlert(title: message, positiveButtonText: positiveButtonText ,positiveButtonClickListener: positiveButtonClickListener, negativeButtonText: negativeButtonText, negativeButtonClickListener: negativeButtonClickListener, cancelButtonText: cancelButtonText, cancelButtonClickListener: cancelButtonClickListener)
    }
    
    
    
    func showProcessResultAlert(
        message: String) {
        let alertController = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        present(alertController, animated: true, completion: nil)
        DispatchQueue.delay(1000) {
            alertController.dismiss(animated: true, completion: nil)
        }
    }

    func showSystemAlert(
        title: String? = nil,
        message: String? = nil,
        positiveButtonText: String? = "Tamam",
        positiveButtonClickListener: (() -> Void)? = nil,
        negativeButtonText: String? = nil,
        negativeButtonClickListener: (() -> Void)? = nil,
        cancelButtonText: String? = nil,
        cancelButtonClickListener: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: positiveButtonText, style: .default, handler: { _ in
            positiveButtonClickListener?()
        }))

        if let negativeButtonText = negativeButtonText {
            alert.addAction(UIAlertAction(title: negativeButtonText, style: .default, handler: { _ in
                negativeButtonClickListener?()
            }))
        }
        
        if let cancelButtonText = cancelButtonText {
            alert.addAction(UIAlertAction(title: cancelButtonText, style: .default, handler: { _ in
                cancelButtonClickListener?()
            }))
        }
        alert.setTintColor(color: .orange)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

extension UIViewController {

    // without nib file exist check
    static func getInstanceFromNib() -> Self {
        func getInstanceFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return getInstanceFromNib(self)
    }

    // with nib file exist check
    static func instantiateFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>(_ viewType: T.Type) -> T {
            guard let _ = Bundle.main.path(forResource: String(describing: T.self), ofType: "nib") else {
                return T.init()
            }
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib(self)
    }
}

