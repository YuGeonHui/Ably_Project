//
//  MainViewController.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import UIKit

final class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        let likeTab = UINavigationController(rootViewController: LikeViewController())
        
        homeTab.title = Main.TabItem.home.title
        likeTab.title = Main.TabItem.like.title
       
        homeTab.tabBarItem = UITabBarItem(title: Main.TabItem.home.title,
                                          image: Main.TabItem.home.iconOn,
                                          selectedImage: Main.TabItem.home.iconOff)
        
        likeTab.tabBarItem = UITabBarItem(title: Main.TabItem.like.title,
                                          image: Main.TabItem.like.iconOn,
                                          selectedImage: Main.TabItem.like.iconOff)
        
        self.setViewControllers([homeTab, likeTab], animated: false)
        self.tabBar.tintColor = .red
    }
}
