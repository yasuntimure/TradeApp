//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

extension UIView {

    public var height: CGFloat {
        return frame.size.height
    }

    public var width: CGFloat {
        return frame.size.width
    }

    func hideKeyboard() {
        endEditing(true)
    }

    func show() {
        visible(true)
    }

    func hide() {
        visible(false)
    }

    func visible(_ visible: Bool) {
        isHidden = !visible
    }


    func setDefaultShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
    
    func setDefaultBorder() {
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
    }

    // like button highlight
    func animatedAlpha(from: CGFloat, to: CGFloat) {
        DispatchQueue.main.async {
            self.alpha = from
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveLinear, animations: {
                self.alpha = to
            }, completion: nil)
        }
    }

    func changeBackgroundColorWithAnimation(color: UIColor?) {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveLinear], animations: {
                self.backgroundColor = color
            }, completion: nil)
    }

    func changeBackgroundColorWithAlphaAnimation(color: UIColor?, from: CGFloat, to: CGFloat) {
        DispatchQueue.main.async {
            self.alpha = from
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveLinear], animations: {
                    self.backgroundColor = color
                    self.alpha = to
                }, completion: nil)
        }
    }

    func showPopUpAnimate() {
        self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        self.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.alpha = 1.0
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }

    func removePopUpAnimate() {
        UIView.animate(withDuration: 0.25,
                       animations: { self.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
                self.alpha = 0.0 },
            completion: { _ in
                    self.removeFromSuperview()
            })
    }
}

// MARK: for Constraints
extension UIView {

    var topConstaint: NSLayoutConstraint? {
        get {
            return findConstraint(layoutAttribute: .top)
        }
        set { setNeedsLayout() }
    }

    var leadingConstaint: NSLayoutConstraint? {
        get {
            return findConstraint(layoutAttribute: .leading)
        }
        set { setNeedsLayout() }
    }

    var bottomConstaint: NSLayoutConstraint? {
        get {
            return findConstraint(layoutAttribute: .bottom)
        }
        set { setNeedsLayout() }
    }

    var trailingConstaint: NSLayoutConstraint? {
        get {
            return findConstraint(layoutAttribute: .trailing)
        }
        set { setNeedsLayout() }
    }


    // width ve height constraint'te çalışmaz
    func findConstraint(layoutAttribute: NSLayoutConstraint.Attribute) -> NSLayoutConstraint? {
        if let constraints = superview?.constraints {
            for constraint in constraints where itemMatch(constraint: constraint, layoutAttribute: layoutAttribute) {
                return constraint
            }
        }
        return nil
    }

    private func itemMatch(constraint: NSLayoutConstraint, layoutAttribute: NSLayoutConstraint.Attribute) -> Bool {
        if let firstItem = constraint.firstItem as? UIView, let secondItem = constraint.secondItem as? UIView {
            let firstItemMatch = firstItem == self && constraint.firstAttribute == layoutAttribute
            let secondItemMatch = secondItem == self && constraint.secondAttribute == layoutAttribute
            return firstItemMatch || secondItemMatch
        }
        return false
    }

}


protocol CustomViewProtocol {
    var contentView: UIView! {get}
    func commonInit(for customViewName: String)
}

extension CustomViewProtocol where Self: UIView {
    func commonInit(for customViewName: String) {
        Bundle.main.loadNibNamed(customViewName, owner: self, options: nil)
        addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}

extension UIView {
     func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}
