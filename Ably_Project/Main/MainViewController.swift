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
        
        homeTab.title = "홈"
        likeTab.title = "좋아요"
       
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        likeTab.tabBarItem = UITabBarItem(title: "좋아요", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        self.setViewControllers([homeTab, likeTab], animated: false)
        self.tabBar.tintColor = .red
    }
}
