//
//  File.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import Foundation
import UIKit
class CategoriesHeader: UIViewFromNib {
    @IBOutlet weak var cat: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText()
    }
    
    func setupText(){
        cat.text = "categories".localized
        
    }

    
}
