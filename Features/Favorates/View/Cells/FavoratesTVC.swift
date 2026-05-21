//
//  FavoratesTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import UIKit
import SDWebImage
class FavoratesTVC: UITableViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(name: String, price: Double, img: String){
        self.price.text = "\(price)"
        self.img.sd_setImage(with: URL(string: img))
        self.name.text = name
    }
}
