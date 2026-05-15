//
//  HomeVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var menuIcon: UIButton!
    @IBOutlet weak var notificationIcon: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var myHomeTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTV()
    }
    
    
    
}
extension HomeVC {
    func setupTV(){
        myHomeTableVIew.showsHorizontalScrollIndicator = false
        myHomeTableVIew.delegate = self
        myHomeTableVIew.dataSource = self
        
        myHomeTableVIew.register(UINib(nibName: "BannerTVC", bundle: nil), forCellReuseIdentifier: "BannerTVC")
        
        myHomeTableVIew.register(UINib(nibName: "CategoriesTVC", bundle: nil), forCellReuseIdentifier: "CategoriesTVC")
        
        myHomeTableVIew.register(UINib(nibName: "ProductsTVC", bundle: nil), forCellReuseIdentifier: "ProductsTVC")
        
    }
}
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        switch indexPath.section  {
        case 0 :
            cell = myHomeTableVIew.dequeueReusableCell(withIdentifier: "BannerTVC", for: indexPath)
            return cell
        case 1 :
            cell = myHomeTableVIew.dequeueReusableCell(withIdentifier: "CategoriesTVC", for: indexPath) as! CategoriesTVC
            return cell
        case 2 :
            cell = myHomeTableVIew.dequeueReusableCell(withIdentifier: "ProductsTVC", for: indexPath)
            return cell
            
        default :
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let headerView = CategoriesHeader()
            return headerView
        case 2:
            let productHeader = ProductsHeader()
            return productHeader
        default :
            return nil
       
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            40
        case 2:
            40
        default :
            0
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            120
        case 1:
            90
        case 2:
            300 * 5
        default:
            0
        }
       
    }
}
