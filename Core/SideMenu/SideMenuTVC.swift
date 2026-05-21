//
//  SideMenuTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import UIKit

class SideMenuTVC: UITableViewCell {

    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String, iconName: String) {
        menuLabel.text = title
        menuImg.image = UIImage(systemName: iconName)
    }
    
}
