//
//  ProductDetailsVC2.swift
//  Full elcetronics store
//
//  Created by Omar on 15/05/2026.
//

import UIKit
import SDWebImage

class ProductDetailsVC2: UIViewController {
    
//MARK: -IBOutlets
    
    @IBOutlet weak var rateView: UIStackView!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var titlee: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var availableOffersLabel: UILabel!
    @IBOutlet weak var freeDeliveryBtn: UIButton!
    @IBOutlet weak var productExchangeBtn: UIButton!
    @IBOutlet weak var addToCartBtn: UIButton!

    @IBOutlet weak var offer3: UILabel!
    @IBOutlet weak var offer2: UILabel!
    @IBOutlet weak var offer1: UILabel!
    
    @IBOutlet weak var heightOfTable: NSLayoutConstraint!
    @IBOutlet weak var RAndRtableView: UITableView!

    
 //MARK: - Properties
    var productId: Int = 0
    let numbOfRows: Int = 2
    
    let viewModel: ProductDetailsViewModel
    let FavViewModel: FavoriteViewModel
    let CartViewModel2: CartViewModel2
    
      override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCell()
        setupText()
        viewModel.getPorductData(id: productId )
        bindViewModel()
        rateView.layer.cornerRadius = 8
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateFavIcon()
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
       
    }
    
    //MARK: - inits
    
    init(id: Int, viewModel: ProductDetailsViewModel, cartVM: CartViewModel2, favViewModel: FavoriteViewModel = ObjsFav.shared.viewMode) {
        self.viewModel = viewModel
        self.FavViewModel = favViewModel
        self.productId = id
        self.CartViewModel2 = cartVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - setup methods
    
    func setupFavIcon(){
        favBtn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
    func setupText() {
        offer1.text = "offer1".localized
        offer2.text = "offer2".localized
        offer3.text = "offer3".localized
        availableOffersLabel.text = "available_offers".localized
        freeDeliveryBtn.setTitle("free_delivery".localized, for: .normal)
        productExchangeBtn.setTitle("exchange_offer".localized, for: .normal)
        addToCartBtn.setTitle("add_to_cart".localized, for: .normal)
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
        var im =  viewModel.PDModel?.images?[0]
        if im == nil{
            img.image = UIImage(named: "noImage")
        }else{
            img.sd_setImage(with: URL(string: im!),placeholderImage: UIImage(named: "img"))

        }
        
        titlee.text = viewModel.PDModel?.title
        price.text = "\(viewModel.PDModel?.price ?? 0) EGP"
        
    }
    func updateFavIcon() {
        let state = ObjsFav.shared.viewMode.isFavorite(productId: productId)
        
        
        let icon = state ? "heart.fill" : "heart"
        favBtn.setImage(UIImage(systemName: icon), for: .normal)
        favBtn.tintColor = state ? .systemRed : .gray
        
        
    }
    
    @IBAction func addToCartTapped(_ sender: Any) {
      
        let vm = viewModel.PDModel
        CartViewModel2.addToCart(product: CartEntity(productId: vm?.id ?? 0, productName: vm?.title ?? "", productImage: vm?.images?[0] ?? "", price: Double(vm?.price ?? 0), quantity: 1))
        CartViewModel2.loadCart()
        Toast.showToast(message: "item_added_to_cart".localized, in: self)
        
        
    }
    
    
    @IBAction func favBtnTapped(_ sender: Any) {
        guard let data = viewModel.PDModel else { return }
        let proIntity = FavoriteEntity(
            productId: data.id ?? 0,
            productName: data.title ?? "",
            productImage: data.images?.first ?? "",
            price: Double(data.price ?? 0)
            
        )
        
        ObjsFav.shared.viewMode.toggleFavorite(product: proIntity)
        
        updateFavIcon()
        let state = ObjsFav.shared.viewMode.isFavorite(productId: productId)
        switch state {
            case true:
            Toast.showToast(message: "added_to_favorites".localized, in: self)
        case false:
            Toast.showToast(message: "removed_from_favorites".localized, in: self)
        }
    }
}
extension ProductDetailsVC2{
    func setupCell(){
        heightOfTable.constant = CGFloat(numbOfRows) * 270
        
        RAndRtableView.register(RatingTVC.self)
        RAndRtableView.register(ReviewTVC.self)
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
            let cell: RatingTVC = RAndRtableView.dequeueReusableCell(for: indexPath)
            cell.imgToShow = { [weak self] imgs, selectedimg in
                guard let self = self else { return }
                let fullscreenVC = FullscreenImageVC(imageUrls: imgs, startIndex: selectedimg)
                fullscreenVC.modalPresentationStyle = .fullScreen
                fullscreenVC.modalTransitionStyle = .crossDissolve
               // self.navigationController?.pushViewController(fullscreenVC, animated: true)
                self.present(fullscreenVC, animated: true)
            }
           
            cell.configure(with: viewModel.PDModel?.images ?? [])
            return cell
        } else if indexPath.row == 1 {
            let cell: ReviewTVC = RAndRtableView.dequeueReusableCell(for: indexPath)
            return cell
        }
        return UITableViewCell()
    }
    
    
}

