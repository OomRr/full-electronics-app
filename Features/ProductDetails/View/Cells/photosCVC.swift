//
//  photosCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 16/05/2026.
//

import UIKit
import SDWebImage
class photosCVC: UICollectionViewCell,IdentifiableView {

   // @IBOutlet weak var picHeight: NSLayoutConstraint!
    @IBOutlet weak var pic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    
    
    func configure(with imgString: String){
        if imgString == "" {
            pic.image = UIImage(named: "noImage")
        }else{
            pic.sd_setImage(with: URL(string: imgString),placeholderImage: UIImage(named: "img"))
        }

    }

}
