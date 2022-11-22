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
