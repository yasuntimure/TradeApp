//
//  KocSistemDemo
//
//  Created by Eyüp on 15.04.2022.
//

import UIKit

// şuanda sadece xib'e göre çalışıyor
// programatic kısmı daha sonra yazılıcak.
extension UITableView {

    func registerCells<T: BaseTableViewCell>(_ instances: [T.Type]) {
        for instance in instances {
            self.registerCell(instance)
        }
    }

    func registerCell<T: BaseTableViewCell>(_ instance: T.Type) {
        self.register(instance.nibInstance, forCellReuseIdentifier: instance.reuseIdentifier)
    }

    func registerCellWithoutNib<T: BaseTableViewCell>(_ instance: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func generateReusableCell<T: BaseTableViewCell>(_ instance: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: instance.reuseIdentifier, for: indexPath) as! T
    }

    func scrollTableViewToBottom(animated: Bool) {
        guard let dataSource = dataSource else { return }

        var lastSectionWithAtLeasOneElements = (dataSource.numberOfSections?(in: self) ?? 1) - 1

        while dataSource.tableView(self, numberOfRowsInSection: lastSectionWithAtLeasOneElements) < 1 {
            lastSectionWithAtLeasOneElements -= 1
        }

        let lastRow = dataSource.tableView(self, numberOfRowsInSection: lastSectionWithAtLeasOneElements) - 1

        guard lastSectionWithAtLeasOneElements > -1 && lastRow > -1 else { return }

        let bottomIndex = IndexPath(item: lastRow, section: lastSectionWithAtLeasOneElements)
        scrollToRow(at: bottomIndex, at: .bottom, animated: animated)
    }
}
