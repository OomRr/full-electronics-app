//
//  ProductsTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit

class ProductsTVC: UITableViewCell {

    @IBOutlet weak var myProductsCollectionView: UICollectionView!
    
    
    var  onProductSelected: ((Int) -> Void)?
    
    
    
    var products: ElectronicsModel = []
    var numOfItemsForH: CGFloat?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupCollectionView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func configure(products: ElectronicsModel){
        self.products = products
        numOfItemsForH = CGFloat((products.count / 2) + 1)
        myProductsCollectionView.reloadData()
    }
}

extension ProductsTVC {
    func setupCollectionView() {
       // myProductsCollectionView.frame.height. = (numOfItems / 2) * 300
        myProductsCollectionView.delegate = self
        myProductsCollectionView.dataSource = self
        myProductsCollectionView.register(UINib(nibName: "ProductsCVC", bundle: nil), forCellWithReuseIdentifier: "ProductsCVC")
    }
}
extension ProductsTVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myProductsCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCVC", for: indexPath) as! ProductsCVC
        cell.configure(homeModel: products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: 250)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let productId = products[indexPath.row].id{
        onProductSelected?(productId)
        }
    }
    
}
