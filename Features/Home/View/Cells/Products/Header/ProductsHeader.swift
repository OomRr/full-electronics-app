//
//  ProductsHeader.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import Foundation
import UIKit
class ProductsHeader: UIViewFromNib{
    @IBOutlet weak var titleLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText()
    }
    
    func setupText(){
        
        titleLabel.text = "top_deals".localized
      
    }
}
