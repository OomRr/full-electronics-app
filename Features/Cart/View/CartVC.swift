//
//  CartVC.swift
//  Full elcetronics store
//
//  Created by Omar on 18/05/2026.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet weak var CartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setuptable()
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
        if section == 0{
           return 2
        }else if section == 1{
           return 1
        }
       return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            
            let cell = CartTableView.dequeueReusableCell(withIdentifier: "CartTVC", for: indexPath)
            return cell
        }else if indexPath.section == 1{
            
            let cell = CartTableView.dequeueReusableCell(withIdentifier: "TotalTVC", for: indexPath)
            return cell
        }else {
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            let middleheader = MiddleHeader()
            return middleheader
        }
        else{
            return nil
        }
  
    }
    
    
}
