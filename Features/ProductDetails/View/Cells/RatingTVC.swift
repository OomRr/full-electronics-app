//
//  RatingTVC.swift
//  Full elcetronics store
//
//  Created by Omar on 15/05/2026.
//

import UIKit

class RatingTVC: UITableViewCell {

    @IBOutlet weak var ratingCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
        setupText()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupText() {
        titleLabel.text = "ratings_reviews".localized
        summaryLabel.text = String(format: "rating_summary".localized, 90, 14)
    }
    
}
extension RatingTVC{
    func setupCell(){
        ratingCollectionView.showsHorizontalScrollIndicator = false
        ratingCollectionView.delegate = self
        ratingCollectionView.dataSource = self
        ratingCollectionView.register(UINib(nibName: "photosCVC", bundle: nil), forCellWithReuseIdentifier: "photosCVC")
    }
}
extension RatingTVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ratingCollectionView.dequeueReusableCell(withReuseIdentifier: "photosCVC", for: indexPath)
        return cell
    }
}
