//
//  BannerCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit
import SDWebImage
import SkeletonView
class BannerCVC: UICollectionViewCell, IdentifiableView {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var bannerImg: UIImageView!
    
    override func awakeFromNib() {
    super.awakeFromNib()
    setupImg()
    self.isSkeletonable = true
    contentView.isSkeletonable = true
    img.isSkeletonable = true
    bannerImg.isSkeletonable = true
        
    }
    func setupImg(){
        img.layer.cornerRadius = 7
        img.clipsToBounds = true
    }
   
    
    
}




extension BannerCVC{
    func configure(with banner: String){
        
        bannerImg.sd_setImage(with: URL(string: banner))
    }
}
