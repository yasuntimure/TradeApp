//
//  TradeValueTableViewCell.swift
//  ForeksTrader
//
//  Created by Eyüp on 25.06.2022.
//  Copyright © 2022 Eyüp Yasuntimur. All rights reserved.
//

import UIKit

final class TradeValueTableViewCell: BaseTableViewCell, Reuseable {

    @IBOutlet weak var assetImage: UIImageView!
    @IBOutlet weak var assetName: UILabel!
    @IBOutlet weak var assetTime: UILabel!
    @IBOutlet weak var assetInfo1: UILabel!
    @IBOutlet weak var assetInfo2: UILabel!

    var cellData: CellData? {
        didSet {
            updateUI()
            storeData()
        }
    }

    func storeData() {
        guard let cellData = cellData else { return }
        guard let codes = cellData.codes else { return }
        DataManager.shared.storedData = codes
    }

    private func updateUI() {
        guard let cellData = cellData else { return }
        guard let codes = cellData.codes else { return }
        let code = codes[cellData.index]
        guard let las = code.las else { return }
        guard let newLastPrice = las.toDouble() else { return }

        let field1 = cellData.fields[0]
        let field2 = cellData.fields[1]

        assetName.text = code.tke
        assetTime.text = code.clo

        if let storedData = DataManager.shared.storedData, storedData[cellData.index].clo != code.clo {
            highlightCell()
            guard let storedLastPrice = storedData[cellData.index].las?.toDouble() else { return }
            if storedLastPrice > newLastPrice {
                setAssetImage(for: .downArrow)
            } else if storedLastPrice < newLastPrice {
                setAssetImage(for: .upArrow)
            }
        }

        switch Fields(rawValue: field1) {
        case .las:
            assetInfo1.text = String(newLastPrice)
        case .pdd:
            assetInfo1.text = code.pdd
        case .ddi:
            assetInfo1.text = code.ddi
        case .low:
            assetInfo1.text = code.low
        case .hig:
            assetInfo1.text = code.hig
        case .buy:
            assetInfo1.text = code.buy
        case .sel:
            assetInfo1.text = code.sel
        case .pdc:
            assetInfo1.text = code.pdc
        case .cei:
            assetInfo1.text = code.cei
        case .flo:
            assetInfo1.text = code.flo
        case .gco:
            assetInfo1.text = code.gco
        case .none:
            assetInfo1.text = nil
        }

        switch Fields(rawValue: field2) {
        case .las:
            assetInfo2.text = String(newLastPrice)
        case .pdd:
            assetInfo2.text = code.pdd
        case .ddi:
            assetInfo2.text = code.ddi
        case .low:
            assetInfo2.text = code.low
        case .hig:
            assetInfo2.text = code.hig
        case .buy:
            assetInfo2.text = code.buy
        case .sel:
            assetInfo2.text = code.sel
        case .pdc:
            assetInfo2.text = code.pdc
        case .cei:
            assetInfo2.text = code.cei
        case .flo:
            assetInfo2.text = code.flo
        case .gco:
            assetInfo2.text = code.gco
        case .none:
            assetInfo2.text = nil
        }
    }

    func setAssetImage(for type: AssetImageType) {
        assetImage.image = UIImage(named: type.rawValue)
    }

    func highlightCell() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .allowUserInteraction) {
            self.backgroundColor = .systemGray6
        }
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .allowUserInteraction) {
            self.backgroundColor = .white
        }
    }
}




