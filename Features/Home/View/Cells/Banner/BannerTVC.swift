//
//  BannerTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit
import SkeletonView

class BannerTVC: UITableViewCell, IdentifiableView {
//MARK: - IBOutlets
    @IBOutlet weak var myBannerCollectionVIew: UICollectionView!
    
    @IBOutlet weak var pageController: UIPageControl!
    
//MARK: - properties
   
   var products: ElectronicsModel = []
    private var timer: Timer?
    private var currentPage = 0
    var  onProductSelected: ((Int) -> Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isSkeletonable = true
        myBannerCollectionVIew.isSkeletonable = true
        setupCollectionView()
                
    }
    
    @objc func pageControllerChanged(_ sender: UIPageControl) {
        let page = sender.currentPage
        let indexPath = IndexPath(item: page, section: 0)
        myBannerCollectionVIew.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}

//MARK: - configure data

extension BannerTVC{

    func configure(with products: ElectronicsModel){
        self.products = products
        self.myBannerCollectionVIew.reloadData()
        startAutoScroll()
        pageController.numberOfPages = 6

    }
}


//MARK: - setupTable
extension BannerTVC{
    func setupCollectionView(){
        myBannerCollectionVIew.showsHorizontalScrollIndicator = false
        myBannerCollectionVIew.delegate = self
        myBannerCollectionVIew.dataSource = self
        myBannerCollectionVIew.register(BannerCVC.self)
        pageController.addTarget(self, action: #selector(pageControllerChanged), for: .valueChanged)
    }
    private func startAutoScroll() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            self?.scrollToNextPage()
        }
    }
    private func scrollToNextPage() {
        guard !products.isEmpty else { return }
        currentPage = (currentPage + 1) % products.count
        if currentPage > 5 {
            currentPage = 0
        }
        let indexPath = IndexPath(item: currentPage, section: 0)
       
        myBannerCollectionVIew.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        pageController.currentPage = currentPage
    }
    
    
}
extension BannerTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCVC = myBannerCollectionVIew.dequeueReusableCell(for: indexPath)
        cell.configure(with: products[indexPath.row].images?[0] ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myBannerCollectionVIew.frame.width, height: myBannerCollectionVIew.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let productId = products[indexPath.row].id{
            onProductSelected?(productId)
        }
    }
}


//MARK: - skeletonView

extension BannerTVC: SkeletonCollectionViewDataSource{
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return "BannerCVC"
    }
}
