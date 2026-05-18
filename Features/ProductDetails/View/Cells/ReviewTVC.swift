//
//  ReviewTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 15/05/2026.
//

import UIKit

class ReviewTVC: UITableViewCell {

    @IBOutlet weak var reviewCollectionVIew: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension ReviewTVC{
    func setupCell(){
        reviewCollectionVIew.showsHorizontalScrollIndicator = false
        reviewCollectionVIew.delegate = self
        reviewCollectionVIew.dataSource = self
        reviewCollectionVIew.register(UINib(nibName: "photosCVC", bundle: nil), forCellWithReuseIdentifier: "photosCVC")
    }
}
extension ReviewTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = reviewCollectionVIew.dequeueReusableCell(withReuseIdentifier: "photosCVC", for: indexPath) as! photosCVC
      //      cell.picHeight.constant = 40
          //  cell.pic.frame.height = 0
          //  cell.contentView.frame.size.height = 0
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 60, height: 60)
    }
    
}


