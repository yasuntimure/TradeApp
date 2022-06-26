//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

extension UICollectionView {

    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func scrollToPreviousItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x - self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }

    func moveToFrame(contentOffset: CGFloat) {
        self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
    }

    func registerCells<T: BaseCollectionViewCell>(_ instances: [T.Type]) {
        for instance in instances {
            self.registerCell(instance)
        }
    }

    func registerCell<T: BaseCollectionViewCell>(_ instance: T.Type) {
        self.register(instance.self, forCellWithReuseIdentifier: instance.reuseIdentifier)
    }

    func registerHeader<T: BaseCollectionReusableView>(_ instance: T.Type) {
        self.register(instance.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                      withReuseIdentifier: instance.reuseIdentifier)
    }

    func registerFooter<T: BaseCollectionReusableView>(_ instance: T.Type) {
        self.register(instance.self,
                      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                      withReuseIdentifier: instance.reuseIdentifier)
    }

    func generateReusableCell<T: BaseCollectionViewCell>(_ instance: T.Type, indexPath: IndexPath) -> T {
        guard let cell =
            self.dequeueReusableCell(withReuseIdentifier: instance.reuseIdentifier, for: indexPath) as? T else {
            fatalError("cell not found -> \(instance.reuseIdentifier)")
        }

        return cell
    }

    func generateReusableHeader<T: BaseCollectionReusableView>(_ instance: T.Type, indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: instance.reuseIdentifier, for: indexPath) as? T else {
            fatalError("header not found -> \(instance.reuseIdentifier)")
        }
        return header
    }

    func generateReusableFooter<T: BaseCollectionReusableView>(_ instance: T.Type, indexPath: IndexPath) -> T {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: instance.reuseIdentifier, for: indexPath) as? T else {
            fatalError("header not found -> \(instance.reuseIdentifier)")
        }
        return header
    }
}
