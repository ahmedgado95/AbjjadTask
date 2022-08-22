//
//  AvailableCurrenciesTableViewCell.swift
//  AbjjadTask
//
//  Created by Ahmed Gado on 19/08/2022.
//

import UIKit

class AvailableCurrenciesTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier: String = "AvailableCurrenciesTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// MARK: - AvailableCurrenciesTableViewCellConfigurable

extension AvailableCurrenciesTableViewCell: AvailableCurrenciesTableViewCellConfigurable {
    func setName(_ name: NSAttributedString) {
        nameLabel.attributedText = name
    }
}
