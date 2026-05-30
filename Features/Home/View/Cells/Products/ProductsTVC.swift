//
//  ProductsTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit
import SkeletonView

class ProductsTVC: UITableViewCell, IdentifiableView {

    @IBOutlet weak var myProductsCollectionView: UICollectionView!
    @IBOutlet weak var cvHeightConstraint: NSLayoutConstraint!
    
    var  onProductSelected: ((Int) -> Void)?
    
    
    
    var products: ElectronicsModel = []
    var numOfItemsForH: CGFloat?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isSkeletonable = true
        self.contentView.isSkeletonable = true
        myProductsCollectionView.isSkeletonable = true
        myProductsCollectionView.isScrollEnabled = false
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
//MARK: - setup collectionView

extension ProductsTVC {
    func setupCollectionView() {
        cvHeightConstraint.constant = ((numOfItemsForH ?? 100) ) * 300
        myProductsCollectionView.isScrollEnabled = false
        myProductsCollectionView.delegate = self
        myProductsCollectionView.dataSource = self
        myProductsCollectionView.register( ProductsCVC.self)
    }
}
extension ProductsTVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, SkeletonCollectionViewDataSource {
    
//MARK: - Skeletonable setup
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return "ProductsCVC"
    }
    
//MARK: - myProductsCollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ProductsCVC = myProductsCollectionView.dequeueReusableCell(for: indexPath)
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
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
