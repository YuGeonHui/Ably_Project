//
//  Banner.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation

struct HomeResponse: Codable {
    
    let banners: [BannerResponse]
    let products: [ProductResponse]
}

extension HomeResponse {
    
    enum CodingKeys: String, CodingKey {
        case banners
        case products = "goods"
    }
}

struct BannerResponse: Hashable, Codable {
    
    let id: Int // 배너 ID
    let imageURL: String // 배너 화면에 보여질 이미지 url
}

extension BannerResponse {
    
    enum CodingKeys: String, CodingKey {
        case id
        case imageURL = "image"
    }
}

struct ProductResponse: Codable {
    
    let id: Int // 상품 ID
    let name: String // 상품 이름
    let imageURL: String // 상품 이미지 url
    
    let actualPrice: Int // 상품 기본가격
    let price: Int // 상품 실제 가격
    
    let isNew: Bool // 신상품 여부
    let sellCnt: Int // 구매중 갯수
}

extension ProductResponse {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image"
        case actualPrice = "actual_price"
        case price
        case isNew = "is_new"
        case sellCnt = "sell_count"
    }
}
