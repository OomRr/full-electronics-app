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
        self.layer.borderWidth = 0.3
        self.layer.borderColor = CGColor(gray: 0.5, alpha: 1)
       // self.setBorderColor("PrimaryTextColor")
        setupText()
        rateView.layer.cornerRadius = 8
       // updateBorderColor()
    }
    
    func setupText() {
        exchangeOfferLabel.text = "exchange_offer".localized
       
    }
    
    func configure(homeModel: ElectronicsModelElement){
        self.price.text = "\(homeModel.price ?? 0) EGP"
        self.productName.text = homeModel.title
        if let imgString = homeModel.images?.first, let url = URL(string: imgString) {
            productImg.sd_setImage(with: url, placeholderImage: UIImage(named: "img"))
        } else {
            productImg.image = UIImage(named: "img")
        }
    }
//    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        super.traitCollectionDidChange(previousTraitCollection)
//        
//        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
//            updateBorderColor()
//        }
//    }
//    
//    private func updateBorderColor() {
//        // resolvedColor converts UIColor → CGColor for the CURRENT trait collection
//        layer.borderColor = UIColor(named: "CardBorder")?
//            .resolvedColor(with: traitCollection)
//            .cgColor
//    }
}

