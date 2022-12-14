//
//  HomeAPIWorker.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/21.
//

import Foundation

enum HomeAPI {
    
    case initialization
    case pagination(Int)
    
    var url: String {
        
        switch self {
        case .initialization:
            return "https://d2bab9i9pr8lds.cloudfront.net/api/home"
        case .pagination(let lastProductId):
            return "https://d2bab9i9pr8lds.cloudfront.net/api/home/goods?lastId=\(lastProductId)"
        }
    }
}
