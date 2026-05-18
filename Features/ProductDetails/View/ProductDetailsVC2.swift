//
//  ProductDetailsVC2.swift
//  Full elcetronics store
//
//  Created by Omar on 15/05/2026.
//

import UIKit
import SDWebImage

class ProductDetailsVC2: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    var productId: Int = 0
    let numbOfRows: Int = 2
    let viewModel: ProductDetailsViewModel
    @IBOutlet weak var heightOfTable: NSLayoutConstraint!
    @IBOutlet weak var RAndRtableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
     
            viewModel.getPorductData(id: productId )
        
//        print("thissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssss \(productId)")
        
        bindViewModel()
       
    }
    
    init(id: Int, viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        self.productId = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(){
        viewModel.onStateChange = { [weak self] state in
            switch state {
            case .loadingState:
                print("loading")
            case .successState:
//                print("thissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssss")
                DispatchQueue.main.async {
                    self?.configure()
                    self?.RAndRtableView.reloadData()
                }
            case .failureState(let error):
                print("thissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssssthissssssssssssssssssss")
                print(error)
                
            }
        }
    }
    
    
    func configure(){
       // var y =  viewModel.PDModel?[0].title
        img.sd_setImage(with: URL(string: viewModel.PDModel?.images?[0] ?? ""))
        titlee.text = viewModel.PDModel?.title
        price.text = "\(viewModel.PDModel?.price ?? 0)"
    }
}
extension ProductDetailsVC2{
    func setupCell(){
        heightOfTable.constant = CGFloat(numbOfRows) * 300
        
        RAndRtableView.register(UINib(nibName: "RatingTVC", bundle: nil), forCellReuseIdentifier: "RatingTVC")
        RAndRtableView.register(UINib(nibName: "ReviewTVC", bundle: nil), forCellReuseIdentifier: "ReviewTVC")
        RAndRtableView.dataSource = self
        RAndRtableView.delegate = self
        RAndRtableView.showsHorizontalScrollIndicator = false
        RAndRtableView.allowsSelection = false
    }
}
extension ProductDetailsVC2: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbOfRows
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
