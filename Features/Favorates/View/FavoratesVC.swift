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
        title = "Favorates"
        
        print("///////////////////////////////////////////")
   //   favsModeld = objsFav.viewMode.favorites
        setupTableView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        objsFav.viewMode.loadFavorites()
        favsModeld = objsFav.viewMode.favorites
    }
    
    func setupTableView(){
        objsFav.viewMode.loadFavorites()
        favTableView.register(UINib(nibName: "FavoratesTVC", bundle: nil), forCellReuseIdentifier: "FavoratesTVC")
        favTableView.delegate = self
        favTableView.dataSource = self
    }
    
}
extension FavoratesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favsModeld.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = favTableView.dequeueReusableCell(withIdentifier: "FavoratesTVC",for: indexPath) as! FavoratesTVC
        assert(favsModeld.count != 0 ,"the favorites is empty")
        print(favsModeld)
        cell.configure(name: favsModeld[indexPath.row].productName, price: favsModeld[indexPath.row].price, img: favsModeld[indexPath.row].productImage)
        return cell
    }
    
    
}
