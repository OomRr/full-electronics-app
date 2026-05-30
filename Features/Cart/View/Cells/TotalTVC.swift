//
//  TotalTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import UIKit

class TotalTVC: UITableViewCell,IdentifiableView {

    @IBOutlet weak var totView: UIView!
    @IBOutlet weak var taxNum: UILabel!
    @IBOutlet weak var shipNum: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var estimatedTotalLabel: UILabel!
    
    @IBOutlet weak var estimatedTotal: UILabel!
    @IBOutlet weak var sutotal: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupText()
        totView.layer.cornerRadius = 10
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setupText() {
        subtotalLabel.text = "subtotal".localized
        shippingLabel.text = "shipping".localized
        taxLabel.text = "tax".localized
        estimatedTotalLabel.text = "estimated_total".localized
    }
    func configure(subtotal: Double){
        if subtotal == 0{
            taxNum.text = "0"
            shipNum.text = "0"
            estimatedTotal.text = "\(subtotal )"
        }else {
           
            estimatedTotal.text = "\(subtotal + 40)"
        }
        self.sutotal.text = "\(subtotal)"
   
        
        
    }
}
