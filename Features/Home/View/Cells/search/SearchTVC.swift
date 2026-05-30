//
//  SearchTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 23/05/2026.
//

import UIKit
import SDWebImage
class SearchTVC: UITableViewCell, IdentifiableView {

    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var img: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with element: ElectronicsModelElement){
        self.img.sd_setImage(with: URL(string: element.images?[0] ?? ""))
        self.name.text = element.title
        self.price.text = "\(element.price ?? 0) EGP"
        
    }
}
