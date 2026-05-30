//
//  CartTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import UIKit
import SDWebImage
class CartTVC: UITableViewCell,IdentifiableView {
    
//MARK: - IBOutlet
    @IBOutlet weak var subtotalWord: UILabel!
    @IBOutlet weak var removeProductWord: UIButton!
    
    @IBOutlet weak var quantityword: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    
    var onRemove: (() -> Void)?
    var updatequantity: ((Int) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText()
        removeProductWord.layer.cornerRadius = 12
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupText(){
        subtotalWord.text = "subtotal".localized
        quantityword.text = "quantity".localized
        removeProductWord.setTitle("remove_item".localized, for: .normal)
        
    }
    
    
    
    func configure(ProName: String,ProPrice: Double,ProQuantity: Int, image: String){
        productName.text = ProName
        quantity.text = "\(ProQuantity)"
        price.text = "\(ProPrice)"
        img.sd_setImage(with: URL(string: image))
        
        
    }
    
    @IBAction func removeItemTapped(_ sender: Any) {
        onRemove?()
    }
    @IBAction func minusBtn(_ sender: Any) {
        updatequantity?(0)
    }
    
    @IBAction func addBtn(_ sender: Any) {
        updatequantity?(1)
    }
}
enum opetration{
    case add
    case sub
}
