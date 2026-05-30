//
////  HomeVC.swift
////  Full elcetronics store
////
////  Created by Omar on 14/05/2026.
////

import UIKit
import SideMenu
import SkeletonView

class HomeVC: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var menuIcon: UIButton!
    @IBOutlet weak var cartIcon: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var myHomeTableVIew: UITableView!
    @IBOutlet weak var cartNum: UILabel!
    @IBOutlet weak var brandLabel: UILabel!
    
    //MARK: - Properties
    private var sideMenu: SideMenuNavigationController!
    var viewModel: HomeViewModelType
    var cartViewModel2: CartViewModel2 = objsCart.shared.viewMode as! CartViewModel2
    var filteredProducts: ElectronicsModel = []
    var isSearching: Bool { return !(searchTF.text?.isEmpty ?? true) }
    
    private let searchResultsTV: UITableView = {
        let tv = UITableView()
        tv.layer.cornerRadius = 12
        tv.layer.shadowColor = UIColor.black.cgColor
        tv.layer.shadowOpacity = 0.15
        tv.layer.shadowRadius = 8
        tv.clipsToBounds = true
      // tv.layer.masksToBounds = false
        
        tv.bouncesVertically = false
        tv.isHidden = true
        return tv
    }()
    
    //MARK: - Inits
    init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTV()
        setupText()
        setupSideMenu()
        setupSearchResultsTV()
        setupTF()
        
        view.isSkeletonable = true
        myHomeTableVIew.showAnimatedGradientSkeleton()
        
        bindViewModel()
        viewModel.getHomeData()
        
        cartNum.layer.cornerRadius = 10
        cartNum.clipsToBounds = true
        cartNum.text = "\(cartViewModel2.cartItems.count)"
    }
    
    //MARK: - ViewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartViewModel2.loadCart()
        cartNum.isHidden = cartViewModel2.cartItems.count == 0
        cartNum.text = "\(cartViewModel2.cartItems.count)"
    }
    
    //MARK: - Setup Text
    func setupText() {
        searchTF.placeholder = "search_placeholder".localized
        brandLabel.text = "brand_name".localized
    }
    
    //MARK: - Setup TextField
    func setupTF() {
        searchTF.addTarget(self, action: #selector(searchTFChanged), for: .editingChanged)
    }
    
    @objc func searchTFChanged() {
        let query = searchTF.text?.lowercased() ?? ""
        
        guard !query.isEmpty else {
            searchResultsTV.isHidden = true
            filteredProducts = []
            return
        }
        
        filteredProducts = (viewModel.homeModel ?? []).filter {
            $0.title?.lowercased().contains(query) ?? false
        }
        
        searchResultsTV.isHidden = filteredProducts.isEmpty
        DispatchQueue.main.async {
            self.searchResultsTV.reloadData()
        }
    }
    
    //MARK: - Setup Search Results TableView
    func setupSearchResultsTV() {
        view.addSubview(searchResultsTV)
        searchResultsTV.delegate = self
        searchResultsTV.dataSource = self
        searchResultsTV.register( SearchTVC.self)
        
        searchResultsTV.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchResultsTV.topAnchor.constraint(equalTo: searchTF.bottomAnchor, constant: 8),
            searchResultsTV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchResultsTV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchResultsTV.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        view.bringSubviewToFront(searchResultsTV)
    }
    
    //MARK: - Setup SideMenu
    func setupSideMenu() {
        let menuVC = SideMenu()
        sideMenu = SideMenuNavigationController(rootViewController: menuVC)
        sideMenu.menuWidth = 260
        sideMenu.presentationStyle = .menuSlideIn
        sideMenu.navigationBar.tintColor = .white
        
        if LocalizationManager.shared.currentLanguage == "en" {
            SideMenuManager.default.rightMenuNavigationController = sideMenu
        } else {
            SideMenuManager.default.leftMenuNavigationController = sideMenu
        }
        
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }
    
    //MARK: - IBActions
    @IBAction func menuIconPushed(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    
    @IBAction func cartIconTapped(_ sender: Any) {
        self.navigationController?.pushViewController(CartVC(cartViewModel2: objsCart.shared.viewMode ), animated: true)
    }
}

//MARK: - Bind ViewModel
extension HomeVC {
    func bindViewModel() {
        viewModel.onStateChange = { [weak self] state in
            switch state {
            case .loadingState:
                DispatchQueue.main.async {
                    self?.myHomeTableVIew.showAnimatedGradientSkeleton()
                }
            case .successState:
                DispatchQueue.main.async {
                    self?.myHomeTableVIew.hideSkeleton()
                    self?.myHomeTableVIew.reloadData()
                }
            case .failureState(let error):
                print(error)
            }
        }
    }
}

//MARK: - Setup TableView
extension HomeVC {
    func setupTV() {
        myHomeTableVIew.isSkeletonable = true
        myHomeTableVIew.showsHorizontalScrollIndicator = false
        myHomeTableVIew.delegate = self
        myHomeTableVIew.dataSource = self
        
        myHomeTableVIew.register(BannerTVC.self)
        myHomeTableVIew.register(CategoriesTVC.self)
        myHomeTableVIew.register(ProductsTVC.self)
        myHomeTableVIew.isScrollEnabled = false

    }
}

//MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == searchResultsTV { return 1 }
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == searchResultsTV { return filteredProducts.count }
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == searchResultsTV {
            guard indexPath.row < filteredProducts.count else {
                return UITableViewCell()
            }
            let cell: SearchTVC = searchResultsTV.dequeueReusableCell( for: indexPath)
            cell.configure(with: filteredProducts[indexPath.row])
            return cell
        }
        
        switch indexPath.section {
        case 0:
            let cell: BannerTVC = myHomeTableVIew.dequeueReusableCell(for: indexPath)
            cell.configure(with: viewModel.homeModel ?? [])
            cell.onProductSelected = { [weak self] selectedId in
                self?.navigationController?.pushViewController(
                    ProductDetailsVC2(id: selectedId,
                                      viewModel: objsPD.shared.viewMode as! ProductDetailsViewModel,
                                      cartVM: CartViewModel2()), animated: true)
            }
            return cell
            
        case 2:
            let cell: ProductsTVC = myHomeTableVIew.dequeueReusableCell(for: indexPath)
            cell.configure(products: viewModel.homeModel ?? [])
            cell.onProductSelected = { [weak self] selectedId in
                self?.navigationController?.pushViewController(
                    ProductDetailsVC2(id: selectedId,
                                      viewModel: objsPD.shared.viewMode as! ProductDetailsViewModel,
                                      cartVM: CartViewModel2()), animated: true)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

//MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if tableView == searchResultsTV {
            let selectedId = filteredProducts[indexPath.row].id ?? 0
            searchResultsTV.isHidden = true
            searchTF.text = ""
            searchTF.resignFirstResponder()
            navigationController?.pushViewController(
                ProductDetailsVC2(id: selectedId,
                                  viewModel: objsPD.shared.viewMode as! ProductDetailsViewModel,
                                  cartVM: CartViewModel2()), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        if tableView == searchResultsTV { return nil }
        switch section {
        case 2:
            let productHeader = ProductsHeader()
            productHeader.setupText()
            return productHeader
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == searchResultsTV { return 0 }
        switch section {
        case 2:  return 40
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == searchResultsTV { return 60 }
        switch indexPath.section {
        case 0:  return 120
        case 1:  return 0
        case 2:  return 600
        default: return 0
        }
    }
}

//MARK: - SkeletonTableViewDataSource
extension HomeVC: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView,
                                cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        switch indexPath.section {
        case 0:  return "BannerTVC"
        case 2:  return "ProductsTVC"
        default: return "BannerTVC"
        }
    }
    
    func numSections(in collectionSkeletonView: UITableView) -> Int { 3 }
    
    func collectionSkeletonView(_ skeletonView: UITableView,
                                numberOfRowsInSection section: Int) -> Int { 1 }
}
