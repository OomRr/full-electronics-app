//
//  OnBoardingCVC.swift
//  Full elcetronics store
//
//  Created by Omar on 13/05/2026.
//

import UIKit

class OnBoardingCVC: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with item: OnBoardingPage){
        title.text = item.title
        details.text = item.description
        
    }

}
