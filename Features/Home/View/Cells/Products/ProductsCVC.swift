//
//  ProductsCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit
import SDWebImage
class ProductsCVC: UICollectionViewCell {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.clipsToBounds = true
        self.contentView.clipsToBounds = true
        self.layer.cornerRadius = 8
    }
    func configure(homeModel: ElectronicsModelElement){
        self.price.text = "\(homeModel.price ?? 0) EGP"
        self.productName.text = homeModel.title
        productImg.sd_setImage(with: URL(string: homeModel.images?[0] ?? ""))
    }
}
