//
//  CatigoriesCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import UIKit

class CatigoriesCVC: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
    }
    func configure(name: String, img: String){
        self.name.text = name
        self.img.image = UIImage(systemName: img)
        self.img.tintColor = .orange
    }
    
   
}
