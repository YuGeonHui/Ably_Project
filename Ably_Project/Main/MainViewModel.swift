//
//  MainViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import UIKit

enum Main {
    
    enum TabItem: Int, CaseIterable {
        
        case home = 0
        case like = 1
        
        var controller: UIViewController {
            switch self {
            case .home:
                return HomeViewController()
            case .like:
                return HomeViewController()
//                return LikeViewController()
            }
        }
        
        var iconOn: UIImage? {
            switch self {
            case .home:
                return UIImage(systemName: "house")
            case .like:
                return UIImage(systemName: "heart")
            }
        }
        
        var iconOff: UIImage? {
            switch self {
            case .home:
                return UIImage(systemName: "house.fill")
            case .like:
                return UIImage(systemName: "heart.fill")
            }
        }
        
        var title: String? {
            switch self {
            case .home:
                return "홈"
            case .like:
                return "좋아요"
            }
        }
    }
}

