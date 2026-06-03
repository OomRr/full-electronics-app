//
//  CatigoriesTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import UIKit

class CatigoriesTVC: UITableViewCell, IdentifiableView {
    @IBOutlet weak var catImg: UIImageView!
    @IBOutlet weak var catName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(name: String, icon: String) {
        catName.text = name
        catImg.image = UIImage(systemName: icon)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = selected ? UIColor.orange.withAlphaComponent(0.1) : .clear
      //  catName.textColor = selected ? .orange : .black
        // لون الـ icon يتغير مع الـ selection
        catImg.tintColor = selected ? .orange : .gray
    }
    
}
