//
//  TabBar.swift
//  Full elcetronics store
//
//  Created by Omar on 20/05/2026.
//

import Foundation


import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarItems()
        tabBar.tintColor = .systemOrange
    }
    func setupTabBarItems() {
        //حطيت كل UIViewController جوا UINavigationController واديته قيم لل tabBar image and title
        let vc1 = UINavigationController(rootViewController: HomeVC(viewModel: ObjsHome.shared.viewMode))
        let vc2 = UINavigationController(rootViewController: CatigoriesVC())
        let vc3 = UINavigationController(rootViewController: SettingsVC())
        let vc4 = UINavigationController(rootViewController: FavoratesVC())
     
      
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc1.tabBarItem.title = "home".localized
        vc2.tabBarItem.image = UIImage(systemName: "circle.grid.2x2.fill")
        vc2.tabBarItem.title = "categories".localized
        vc3.tabBarItem.image = UIImage(systemName: "gear")
        vc3.tabBarItem.title = "settings".localized
        vc4.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc4.tabBarItem.title = "favorites".localized
        
        //هنا ببعت باه ال UINavigationControllers لل MainTabBarViewController بتاعي عادي
        //ال setViewControllers دي تبع UITabBarController
        setViewControllers([vc1, vc2, vc4,vc3], animated: true)
    }
    
    
}
