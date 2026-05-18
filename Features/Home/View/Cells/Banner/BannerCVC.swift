//
//  BannerCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit
import SDWebImage
class BannerCVC: UICollectionViewCell {

    @IBOutlet weak var bannerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
extension BannerCVC{
    func configure(with banner: String){
        
        bannerImg.sd_setImage(with: URL(string: banner))
    }
}
