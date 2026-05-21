//
//  HomeVC.swift
//  Full elcetronics store
//
//  Created by Omar on 14/05/2026.
//
import UIKit
import SideMenu

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
    var cartViewModel2: CartViewModel2 = CartViewModel2()
    
//MARK: - inits
    
    init(viewModel: HomeViewModelType){
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
        viewModel.getHomeData()
        bindViewModel()
       // cartViewModel2.loadCart()
        cartNum.layer.cornerRadius = 10
        cartNum.clipsToBounds = true
        cartNum.text = "\(cartViewModel2.cartItems.count)"
        setupSideMenu()
      //  setupMenuButton()
    }
    
    func setupText() {
        searchTF.placeholder = "search_placeholder".localized
        brandLabel.text = "brand_name".localized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartViewModel2.loadCart()
        if cartViewModel2.cartItems.count == 0 {
            cartNum.isHidden = true
        }else{
            cartNum.isHidden = false
        }
        cartNum.text = "\(cartViewModel2.cartItems.count)"
    }
    
    
    func setupSideMenu(){
        let menuVC = SideMenu()
        sideMenu = SideMenuNavigationController(rootViewController: menuVC)
        sideMenu.menuWidth = 260
        sideMenu.presentationStyle = .menuSlideIn
        sideMenu.navigationBar.tintColor = .white
        if LocalizationManager.shared.currentLanguage == "en"{
            SideMenuManager.default.rightMenuNavigationController = sideMenu
        }else{
            SideMenuManager.default.leftMenuNavigationController = sideMenu
        }
       
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        
        
    }
    

    
    @IBAction func menuIconPushed(_ sender: Any) {
        present(sideMenu, animated: true)
    }
    
    @IBAction func cartIconTapped(_ sender: Any) {
        self.navigationController?.pushViewController(CartVC(), animated: true)
    }
}
//MARK: - binding ViewModel

extension HomeVC {
    func bindViewModel(){
        viewModel.onStateChange  = { [weak self] state in
            switch state {
            case .loadingState:
                print("loading")
            case .successState:
              
                DispatchQueue.main.async {
                    self?.myHomeTableVIew.reloadData()
                }
            case .failureState(let error):
                print(error)
                
            }
        }
    }
}
//MARK: - Setup tableview
extension HomeVC {
    func setupTV(){
        myHomeTableVIew.showsHorizontalScrollIndicator = false
        myHomeTableVIew.delegate = self
        myHomeTableVIew.dataSource = self
        
        myHomeTableVIew.register(UINib(nibName: "BannerTVC", bundle: nil), forCellReuseIdentifier: "BannerTVC")
        
        myHomeTableVIew.register(UINib(nibName: "CategoriesTVC", bundle: nil), forCellReuseIdentifier: "CategoriesTVC")
        
        myHomeTableVIew.register(UINib(nibName: "ProductsTVC", bundle: nil), forCellReuseIdentifier: "ProductsTVC")
    }
}
//MARK: - delegate and datasource
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell = UITableViewCell()
        switch indexPath.section  {
        case 0 :
           let cell = myHomeTableVIew.dequeueReusableCell(withIdentifier: "BannerTVC", for: indexPath) as! BannerTVC
            cell.configure(with: viewModel.homeModel?[0].images ?? [])
            
            return cell
        case 1 :
            cell = myHomeTableVIew.dequeueReusableCell(withIdentifier: "CategoriesTVC", for: indexPath) as! CategoriesTVC
            return cell
        case 2 :
          let  cell = myHomeTableVIew.dequeueReusableCell(withIdentifier: "ProductsTVC", for: indexPath) as! ProductsTVC
            cell.configure(products: viewModel.homeModel ?? [])
            cell.onProductSelected = {[weak self] selectedId in
                self?.navigationController?.pushViewController(ProductDetailsVC2(id: selectedId,viewModel: objsPD.viewMode,cartVM: CartViewModel2()), animated: true)
            }
            return cell
            
        default :
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let headerView = CategoriesHeader()
            headerView.setupText()
            return headerView
        case 2:
            let productHeader = ProductsHeader()
            productHeader.setupText()
            return productHeader
        default :
            return nil
       
        }
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1:
            40
        case 2:
            40
        default :
            0
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            120
        case 1:
            90
        case 2:
            300 * 5
        default:
            0
        }
    }
}
