//
//  CartTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import UIKit

class CartTVC: UITableViewCell {
    
//MARK: - IBOutlet
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    
    
    var onRemove: (() -> Void)?
    var updatequantity: ((Int) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(ProName: String,ProPrice: Double,ProQuantity: Int){
        productName.text = ProName
        quantity.text = "\(ProQuantity)"
        price.text = "\(ProPrice)"
        
        
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
