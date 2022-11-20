//
//  Product.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/19.
//

import Foundation

// MARK: Mock Data
struct Product: Hashable {
    
    let id: Int // 상품 ID
    let name: String // 상품 이름
    let iamgeURL: String // 상품 이미지 url
    
    let actualPrice: Int // 상품 기본가격
    let price: Int // 상품 실제 가격
    
    let isNew: Bool // 신상품 여부
    let sellCnt: Int // 구매중 갯수
}

extension Product {
    
    static let list: [Product] = [
    
        Product(id: 1, name: "[선물포장/별자리각인] 집들이 선물 원목 별자리 인센스 스틱 홀더 3type 호두나무 참나무 단풍나무 인테리어소품 감성소품 캠핑용품", iamgeURL: "https://d20s70j9gw443i.cloudfront.net/t_GOODS_THUMB_WEBP/https://imgb.a-bly.com/data/goods/20210122_1611290798811044s.jpg", actualPrice: 18000, price: 16000, isNew: false, sellCnt: 61),
        Product(id: 2, name: "[당일출고]왕박시핏! 스트링 야상 자켓;2col", iamgeURL: "https://d20s70j9gw443i.cloudfront.net/t_GOODS_THUMB_WEBP/https://imgb.a-bly.com/data/goods/20210122_1611290798811044s.jpg", actualPrice: 18000, price: 16000, isNew: false, sellCnt: 61),
        Product(id: 3, name: "[세트할인!]인기상품~벨치스 포켓 후드집업 + 피얼즈 골지스판 뷔스티에 원피스 세트상품", iamgeURL: "https://d20s70j9gw443i.cloudfront.net/t_GOODS_THUMB_WEBP/https://imgb.a-bly.com/data/goods/20210225_1614264987060340s.gif", actualPrice: 34000, price: 34000, isNew: false, sellCnt: 58),
        Product(id: 4, name: "[SET] 환생, 후드집업 + 트레이닝 팬츠 투피스 / 강추", iamgeURL: "https://d20s70j9gw443i.cloudfront.net/t_GOODS_THUMB_WEBP/https://imgb.a-bly.com/data/goods/20210211_1613026474459090s.gif", actualPrice: 38000, price: 34000, isNew: true, sellCnt: 4044),
        Product(id: 5, name: "[12종]레터링케이크캔들+생일머리띠", iamgeURL: "https://d20s70j9gw443i.cloudfront.net/t_GOODS_THUMB_WEBP/https://imgb.a-bly.com/data/goods/20201015_1602759623544509s.jpg", actualPrice: 23000, price: 19900, isNew: false, sellCnt: 977)
    ]
}
