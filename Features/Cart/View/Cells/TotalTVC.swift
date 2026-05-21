//
//  TotalTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import UIKit

class TotalTVC: UITableViewCell {

    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var estimatedTotalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupText() {
        subtotalLabel.text = "subtotal".localized
        shippingLabel.text = "shipping".localized
        taxLabel.text = "tax".localized
        estimatedTotalLabel.text = "estimated_total".localized
    }
}
