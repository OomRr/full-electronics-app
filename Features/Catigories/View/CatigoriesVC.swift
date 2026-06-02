//
//  CatigoriesVC.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import UIKit

class CatigoriesVC: UIViewController {

    @IBOutlet weak var catTableView: UITableView!
    @IBOutlet weak var catCollectionVIew: UICollectionView!
    
    
    var categories: [Category] = [
        Category(name: "category_mobile".localized, icon: "iphone", subcategories: [
            Subcategory(name: "sub_smartphones".localized, image: "iphone"),
            Subcategory(name: "sub_tablets".localized, image: "ipad"),
            Subcategory(name: "sub_smartwatch".localized, image: "applewatch"),
            Subcategory(name: "sub_simcards".localized, image: "simcard"),
        ]),
        Category(name: "category_accessories".localized, icon: "headphones", subcategories: [
            Subcategory(name: "sub_headphones".localized, image: "headphones"),
            Subcategory(name: "sub_chargers".localized, image: "bolt.fill"),
            Subcategory(name: "sub_cases".localized, image: "apps.iphone"),
            Subcategory(name: "sub_cables".localized, image: "cable.connector"),
        ]),
        Category(name: "category_computers".localized, icon: "laptopcomputer", subcategories: [
            Subcategory(name: "sub_laptops".localized, image: "laptopcomputer"),
            Subcategory(name: "sub_desktops".localized, image: "desktopcomputer"),
            Subcategory(name: "sub_printers".localized, image: "printer"),
            Subcategory(name: "sub_storage".localized, image: "externaldrive"),
            Subcategory(name: "sub_electronic_sol".localized, image: "cpu"),
            Subcategory(name: "sub_build_pc".localized, image: "memorychip"),
        ]),
        Category(name: "category_gaming".localized, icon: "gamecontroller", subcategories: [
            Subcategory(name: "sub_consoles".localized, image: "gamecontroller"),
            Subcategory(name: "sub_controllers".localized, image: "dpad"),
            Subcategory(name: "sub_gaming_chairs".localized, image: "chair.lounge"),
            Subcategory(name: "sub_headsets".localized, image: "headphones"),
        ]),
        Category(name: "category_home".localized, icon: "house", subcategories: [
            Subcategory(name: "sub_tv".localized, image: "tv"),
            Subcategory(name: "sub_ac".localized, image: "air.conditioner.horizontal"),
            Subcategory(name: "sub_washing".localized, image: "washer"),
            Subcategory(name: "sub_refrigerator".localized, image: "refrigerator"),
        ]),
        Category(name: "category_corporate".localized, icon: "building.2", subcategories: [
            Subcategory(name: "sub_servers".localized, image: "server.rack"),
            Subcategory(name: "sub_networking".localized, image: "network"),
            Subcategory(name: "sub_projectors".localized, image: "videoprojector"),
            Subcategory(name: "sub_security".localized, image: "lock.shield"),
        ]),
        Category(name: "category_deals".localized, icon: "tag", subcategories: [
            Subcategory(name: "sub_daily_deals".localized, image: "tag"),
            Subcategory(name: "sub_clearance".localized, image: "percent"),
            Subcategory(name: "sub_bundles".localized, image: "shippingbox"),
            Subcategory(name: "sub_refurbished".localized, image: "arrow.clockwise"),
        ]),
    ]
    var currentSubcategories: [Subcategory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "categories".localized
        currentSubcategories = categories.first?.subcategories ?? []
        setupTableView()
        setupCollectionView()
        
    }

}

extension CatigoriesVC{
   func setupTableView(){
        catTableView.dataSource = self
        catTableView.delegate = self
       catTableView.register(CatigoriesTVC.self)
    }
    
   func setupCollectionView(){
        catCollectionVIew.dataSource = self
        catCollectionVIew.delegate = self
       catCollectionVIew.register(CatigoriesCVC.self)
    }
    
}


extension CatigoriesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CatigoriesTVC = catTableView.dequeueReusableCell(for: indexPath)
        let item = categories[indexPath.row]
        cell.configure(name: item.name, icon: item.icon)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentSubcategories = categories[indexPath.row].subcategories
        catCollectionVIew.reloadData()
    }
    
    
    
}
extension CatigoriesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        currentSubcategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: CatigoriesCVC = catCollectionVIew.dequeueReusableCell( for: indexPath) 
        let item = currentSubcategories[indexPath.row]
        cell.configure(name: item.name, img: item.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (catCollectionVIew.frame.width - 24)/2,
               height: (catCollectionVIew.frame.width - 24)/2)
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let selected = categories[indexPath.row]
     
        currentSubcategories = selected.subcategories
        catCollectionVIew.reloadData()
    }
    
}
