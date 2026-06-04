//  CartVC.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var totalName: UILabel!
    var cartViewModel2: CartViewModel2
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var totalPrice: Double = 0
    
    ///For the api requests
    ///
    ///
    init(cartViewModel2: CartViewModelType) {
        
        self.cartViewModel2 = cartViewModel2 as! CartViewModel2
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBOutlet weak var CartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptable()
        cartViewModel2.loadCart()
        calcTotalPrice()
        totalPriceLabel.text = "\(totalPrice) EGP"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setuptable()
        cartViewModel2.loadCart()
        calcTotalPrice()
        totalPriceLabel.text = "\(totalPrice) EGP"
        setuplang()
        refreshTotal()
    }
    func setuplang(){
        totalName.text = "total".localized
        buyBtn.setTitle("buy_now".localized, for: .normal)
    }
  public func calcTotalPrice(){
      totalPrice = 0
        for i in cartViewModel2.cartItems{
            totalPrice += i.price * Double(i.quantity)
       }
       
    }
    func refreshTotal() {
        calcTotalPrice()
        if totalPrice == 0 {
            totalPriceLabel.text = "0.0 EGP"
        }else{
            
            totalPriceLabel.text = "\(totalPrice + 40) EGP"
        }
        
    }
}



extension CartVC{
    func setuptable(){
        CartTableView.delegate = self
        CartTableView.dataSource = self
        CartTableView.register(CartTVC.self)
        CartTableView.register(TotalTVC.self)
    }
}
extension CartVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cartViewModel2.cartItems.count
        }else if section == 1 {
           return 1
        }
       return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let item = cartViewModel2.cartItems[indexPath.row]
            let cell: CartTVC = CartTableView.dequeueReusableCell(for: indexPath)
            
            cell.configure(ProName: item.productName, ProPrice: item.price, ProQuantity: item.quantity,image: item.productImage)
            
            cell.onRemove = { [weak self] in
                self?.cartViewModel2.removeItem(productId: item.productId)
              //  self?.CartTableView.reloadData()
               
                self?.refreshTotal()
                self?.CartTableView.reloadData()
                
            }
            cell.updatequantity = { [weak self] (quantity) in
                switch quantity  {
                case 0:
                    self?.cartViewModel2.updateQuantity(productId: item.productId, quantity: item.quantity - 1)
                    self?.refreshTotal()
                   
                case 1:
                    self?.cartViewModel2.updateQuantity(productId: item.productId, quantity: item.quantity + 1)
                    self?.refreshTotal()
                default :
                    print("ok")
                }
                self?.CartTableView.reloadData()
            }
            
            return cell
        }
        else if indexPath.section == 1 {
            
            let cell: TotalTVC = CartTableView.dequeueReusableCell(for: indexPath)
            
            cell.configure(subtotal: totalPrice)
            return cell
        }
        else {
            return UITableViewCell()
        }
        
    }

}
