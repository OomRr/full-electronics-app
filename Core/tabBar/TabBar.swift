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
        // Do any additional setup after loading the view.
    }
    func setupTabBarItems() {
        //حطيت كل UIViewController جوا UINavigationController واديته قيم لل tabBar image and title
        let vc1 = UINavigationController(rootViewController: HomeVC(viewModel: objs.viewMode))
        let vc2 = UINavigationController(rootViewController: CatigoriesVC())
        let vc3 = UINavigationController(rootViewController: SettingsVC())
        let vc4 = UINavigationController(rootViewController: CartVC())
     
      
        
        vc1.tabBarItem.image = UIImage(systemName: "house.fill")
        vc1.tabBarItem.title = "Home"
        vc2.tabBarItem.image = UIImage(systemName: "circle.grid.2x2")
        vc2.tabBarItem.title = "Catigories"
        vc3.tabBarItem.image = UIImage(systemName: "gear")
        vc3.tabBarItem.title = "Settings"
        vc4.tabBarItem.image = UIImage(systemName: "cart")
        vc4.tabBarItem.title = "Cart"
        
        
        
        //هنا ببعت باه ال UINavigationControllers لل MainTabBarViewController بتاعي عادي
        //ال setViewControllers دي تبع UITabBarController
        setViewControllers([vc1, vc2, vc4,vc3], animated: true)
    }
    
    
}
