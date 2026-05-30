//
//  SideMenu.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import UIKit

class SideMenu: UIViewController {

    @IBOutlet weak var SideMenuTableView: UITableView!
    
    let menuItems: [String] = ["settings".localized, "favorites".localized,]
    
    let menuIcons: [String] = ["gear", "heart.fill"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        setupTableView()
        setupCloseButton()
    }
    private func setupCloseButton() {
        let closeButton = UIBarButtonItem(
            image: UIImage(systemName: "xmark",),
            style: .plain,
            target: self,
            action: #selector(closeTapped)
            
        )
        closeButton.tintColor = .black
        navigationItem.leftBarButtonItem = closeButton
    }
    
    @objc private func closeTapped() {
        dismiss(animated: true)
    }
    
    
    func setupTableView(){
        SideMenuTableView.delegate = self
        SideMenuTableView.dataSource = self
        SideMenuTableView.register(SideMenuTVC.self)
      
    }
    
}
extension SideMenu: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0{
            self.navigationController?.pushViewController(SettingsVC(), animated: true)
        }else if indexPath.row == 1 {
            self.navigationController?.pushViewController(FavoratesVC(), animated: true)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SideMenuTVC = SideMenuTableView.dequeueReusableCell(for: indexPath)
        
        cell.configure(title: menuItems[indexPath.row], iconName: menuIcons[indexPath.row])
        return cell
    }
    
    
}
