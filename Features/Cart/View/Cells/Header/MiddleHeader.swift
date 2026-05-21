//
//  MiddleHeader.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import Foundation
import UIKit

class MiddleHeader: UIViewFromNib {
    @IBOutlet weak var emptyCartBtn: UIButton!
    @IBOutlet weak var continueShoppingBtn: UIButton!
    @IBOutlet weak var priceDetailsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText()
    }
    
    func setupText() {
        emptyCartBtn.setTitle("empty_cart".localized, for: .normal)
        continueShoppingBtn.setTitle("continue_shopping".localized, for: .normal)
        priceDetailsLabel.text = "price_details".localized
    }
}
