//
//  Banner.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation

struct Banner: Hashable, Codable {
    
    let id: Int // 배너 ID
    let imageURL: String // 배너 화면에 보여질 이미지 url
}

extension Banner {
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image"
    }
}

// MARK: Mock Data
extension Banner {
    
    static let list: [Banner] = [
    
        Banner(id: 1, imageURL: "https://img.a-bly.com/banner/images/banner_image_1615465448476691.jpg"),
        Banner(id: 2, imageURL: "https://img.a-bly.com/banner/images/banner_image_1615970086333899.jpg"),
        Banner(id: 3, imageURL: "https://img.a-bly.com/banner/images/banner_image_1615962899391279.jpg")
    ]
}
