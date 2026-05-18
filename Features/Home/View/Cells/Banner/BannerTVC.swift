//
//  BannerTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//

import UIKit

class BannerTVC: UITableViewCell {
//MARK: - IBOutlets
    @IBOutlet weak var myBannerCollectionVIew: UICollectionView!
    
    
//MARK: - properties
   var imagesString: [String] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    
}

//MARK: - configure data

extension BannerTVC{
    func configure(with banners: [String]){
        imagesString = banners
        self.myBannerCollectionVIew.reloadData()
    }
}


//MARK: - setupTable
extension BannerTVC{
    func setupCollectionView(){
        myBannerCollectionVIew.showsHorizontalScrollIndicator = false
        myBannerCollectionVIew.delegate = self
        myBannerCollectionVIew.dataSource = self
        myBannerCollectionVIew.register(UINib(nibName: "BannerCVC", bundle: nil), forCellWithReuseIdentifier: "BannerCVC")
    }
}
extension BannerTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imagesString.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myBannerCollectionVIew.dequeueReusableCell(withReuseIdentifier: "BannerCVC", for: indexPath) as! BannerCVC
        cell.configure(with: imagesString[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: myBannerCollectionVIew.frame.width, height: myBannerCollectionVIew.frame.height)
    }
    
}
