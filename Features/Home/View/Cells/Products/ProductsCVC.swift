//
//  ProductsCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit
import SDWebImage
import SkeletonView

class ProductsCVC: UICollectionViewCell, IdentifiableView {

    @IBOutlet weak var rateView: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var exchangeOfferLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.isSkeletonable = true
        self.clipsToBounds = true
        self.contentView.clipsToBounds = true
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 0.2
        setupText()
        rateView.layer.cornerRadius = 8
    }
    
    func setupText() {
        exchangeOfferLabel.text = "exchange_offer".localized
       
    }
    
    func configure(homeModel: ElectronicsModelElement){
        self.price.text = "\(homeModel.price ?? 0) EGP"
        self.productName.text = homeModel.title
        productImg.sd_setImage(with: URL(string: homeModel.images?[0] ?? ""))
    }
}
