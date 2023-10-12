//
//  MainTabBarController.swift
//  BuySneakers
//
//  Created by Alikhan Tangirbergen on 12.10.2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = UINavigationController(rootViewController: CatalogViewController())
        let vc2 = UINavigationController(rootViewController: CartViewController())
        let vc3 = UINavigationController(rootViewController: ProfileViewController())
        
        vc1.tabBarItem.image = UIImage(systemName: "house")
        vc1.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        vc2.tabBarItem.image = UIImage(systemName: "cart")
        vc2.tabBarItem.selectedImage = UIImage(systemName: "cart.fill")
        vc3.tabBarItem.image = UIImage(systemName: "person.circle")
        vc3.tabBarItem.selectedImage = UIImage(systemName: "person.circle.fill")
        
        
        vc1.title = "Catalog"
        vc2.title = "Cart"
        vc3.title = "Profile"
        
        tabBar.tintColor = .label
        
        setViewControllers([vc1, vc2, vc3], animated: true)
        
    }

}
