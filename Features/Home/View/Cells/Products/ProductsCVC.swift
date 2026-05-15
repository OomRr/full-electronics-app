//
//  ProductsCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit

class ProductsCVC: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.clipsToBounds = true
        self.contentView.clipsToBounds = true
        self.layer.cornerRadius = 8
    }
    
}
