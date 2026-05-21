//
//  ProductDetailsVC2.swift
//  Full elcetronics store
//
//  Created by Omar on 15/05/2026.
//

import UIKit
import SDWebImage

class ProductDetailsVC2: UIViewController {
    
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var seeMoreBtn: UIButton!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var availableOffersLabel: UILabel!
    @IBOutlet weak var freeDeliveryBtn: UIButton!
    @IBOutlet weak var productExchangeBtn: UIButton!
    @IBOutlet weak var addToCartBtn: UIButton!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var similarProductsLabel: UILabel!
    
 
    var productId: Int = 0
    let numbOfRows: Int = 2
    let viewModel: ProductDetailsViewModel
    let FavViewModel: FavoriteViewModel
    
    let CartViewModel2: CartViewModel2
    @IBOutlet weak var heightOfTable: NSLayoutConstraint!
    @IBOutlet weak var RAndRtableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCell()
        setupText()
        viewModel.getPorductData(id: productId )
        
        updateFavIcon()
       // updateFavIcon()

        bindViewModel()
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFavIcon()
    }
    
    
    init(id: Int, viewModel: ProductDetailsViewModel, cartVM: CartViewModel2, favViewModel: FavoriteViewModel = objsFav.viewMode) {
        self.viewModel = viewModel
        self.FavViewModel = favViewModel
        self.productId = id
        self.CartViewModel2 = cartVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupFavIcon(){
        favBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
 
    
    func setupText() {
        seeMoreBtn.setTitle("see_more".localized, for: .normal)
        availableOffersLabel.text = "available_offers".localized
        freeDeliveryBtn.setTitle("free_delivery".localized, for: .normal)
        productExchangeBtn.setTitle("exchange_offer".localized, for: .normal)
        addToCartBtn.setTitle("add_to_cart".localized, for: .normal)
        buyNowBtn.setTitle("buy_now".localized, for: .normal)
        similarProductsLabel.text = "similar_products".localized
        
        // Example for dynamic string
        ratingCountLabel.text = String(format: "rating_count".localized, 90)
    }
    
    func bindViewModel(){
        viewModel.onStateChange = { [weak self] state in
            switch state {
            case .loadingState:
                
                print("loading")
            case .successState:
                
                DispatchQueue.main.async {
                    self?.configure()
                    self?.RAndRtableView.reloadData()
                }
            case .failureState(let error):
               
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
    func updateFavIcon() {
        let state = objsFav.viewMode.isFavorite(productId: productId)
        
       
        let icon = state ? "heart.fill" : "heart"
        favBtn.setImage(UIImage(systemName: icon), for: .normal)
        favBtn.tintColor = state ? .red : .gray
        
        
    }
    
    @IBAction func addToCartTapped(_ sender: Any) {
      
        let vm = viewModel.PDModel
        CartViewModel2.addToCart(product: CartEntity(productId: vm?.id ?? 0, productName: vm?.title ?? "", productImage: vm?.images?[0] ?? "", price: Double(vm?.price ?? 0), quantity: 1))
        CartViewModel2.loadCart()
      
        
        
    }
    
    
    @IBAction func favBtnTapped(_ sender: Any) {
        guard let data = viewModel.PDModel else { return }
        let proIntity = FavoriteEntity(
            productId: data.id ?? 0,
            productName: data.title ?? "",
            productImage: data.images?.first ?? "",
            price: Double(data.price ?? 0)
        )
        
        objsFav.viewMode.toggleFavorite(product: proIntity)
        updateFavIcon()
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
