//
//  FavoratesVC.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import UIKit

class FavoratesVC: UIViewController {

    @IBOutlet weak var favTableView: UITableView!
    var favsModeld: [FavoriteEntity] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "favorites".localized
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ObjsFav.shared.viewMode.loadFavorites()
        favsModeld = ObjsFav.shared.viewMode.favorites
        favTableView.reloadData()
    }
    
    func setupTableView(){
        ObjsFav.shared.viewMode.loadFavorites()
        favTableView.register(FavoratesTVC.self)
        favTableView.delegate = self
        favTableView.dataSource = self
    }
    
}
extension FavoratesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favsModeld.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FavoratesTVC = favTableView.dequeueReusableCell(for: indexPath)
       
        let fav = favsModeld[indexPath.row]
     
        cell.configure(name: fav.productName, price: fav.price, img: fav.productImage)
        cell.onRemove = { [weak self] in
            var vm = ObjsFav.shared.viewMode
            
            vm.removeFavorite(productId: fav.productId)
            vm.loadFavorites()
            self?.favsModeld = vm.favorites
            self?.favTableView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
