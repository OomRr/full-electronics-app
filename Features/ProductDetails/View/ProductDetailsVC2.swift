//
//  ProductDetailsVC2.swift
//  Full elcetronics store
//
//  Created by Omar on 15/05/2026.
//

import UIKit

class ProductDetailsVC2: UIViewController {
    @IBOutlet weak var RAndRtableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
    }
}
extension ProductDetailsVC2{
    func setupCell(){
        RAndRtableView.register(UINib(nibName: "RatingTVC", bundle: nil), forCellReuseIdentifier: "RatingTVC")
        RAndRtableView.register(UINib(nibName: "ReviewTVC", bundle: nil), forCellReuseIdentifier: "ReviewTVC")
        RAndRtableView.dataSource = self
        RAndRtableView.delegate = self
        RAndRtableView.showsHorizontalScrollIndicator = false
    }
}
extension ProductDetailsVC2: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = RAndRtableView.dequeueReusableCell(withIdentifier: "RatingTVC", for: indexPath)
            print(cell.contentView)
            return cell
        } else if indexPath.row == 1 {
            let cell = RAndRtableView.dequeueReusableCell(withIdentifier: "ReviewTVC", for: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
}
