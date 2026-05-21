//
//  CartVC.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import UIKit

class CartVC: UIViewController {

   // let cartViewModel: CartViewModel? = nil
    let cartViewModel2: CartViewModel2 = CartViewModel2()
    ///For the api requests
    ///
    ///
//    init(cartViewModel: CartViewModel) {
//        
//        self.cartViewModel = cartViewModel
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    @IBOutlet weak var CartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptable()
        //cartViewModel.getCartData(userId: 44)
        
        cartViewModel2.loadCart()
        print(cartViewModel2.cartItems)
    }
   
}
extension CartVC{
    func setuptable(){
        CartTableView.delegate = self
        CartTableView.dataSource = self
        CartTableView.register(UINib(nibName: "CartTVC", bundle: nil), forCellReuseIdentifier: "CartTVC")
        CartTableView.register(UINib(nibName: "TotalTVC", bundle: nil), forCellReuseIdentifier: "TotalTVC")
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
            var item = cartViewModel2.cartItems[indexPath.row]
            let cell = CartTableView.dequeueReusableCell(withIdentifier: "CartTVC", for: indexPath) as! CartTVC
            
            cell.configure(ProName: item.productName, ProPrice: item.price, ProQuantity: item.quantity)
            
            cell.onRemove = { [weak self] in
                self?.cartViewModel2.removeItem(productId: item.productId)
                self?.CartTableView.reloadData()
            

                
            }
            cell.updatequantity = { [weak self] (quantity) in
                switch quantity  {
                case 0:
                    self?.cartViewModel2.updateQuantity(productId: item.productId, quantity: item.quantity - 1)
                   
                case 1:
                    self?.cartViewModel2.updateQuantity(productId: item.productId, quantity: item.quantity + 1)
                default :
                    print("ok")
                }
                self?.CartTableView.reloadData()
            }
            
            return cell
        }else if indexPath.section == 1 {
            
            let cell = CartTableView.dequeueReusableCell(withIdentifier: "TotalTVC", for: indexPath)
            return cell
        }else {
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let middleheader = MiddleHeader()
            middleheader.setupText()
            return middleheader
        }
        else{
            return nil
        }
  
    }
    
    
}
