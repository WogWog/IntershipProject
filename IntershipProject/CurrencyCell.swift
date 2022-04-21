//
//  CurrencyCell.swift
//  IntershipProject
//
//  Created by Валерия Прокушева on 09.04.2022.
//

import UIKit

class CurrencyCell: UICollectionViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    override func awakeFromNib() {
            super.awakeFromNib()
            setupInitialState()
        }

    func setupCell(data: Currency) {
        priceLabel.text = String(data.value)
        nameLabel.text = String(data.name)
    }
    
    private func setupInitialState() {
        layer.cornerRadius = ViewController.Constants.cellCornerRadius
    }
}
