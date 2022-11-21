//
//  HomeBannerViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

class HomeBannerViewModel  {
    
    let banner: Banner
    
    init(_ banner: Banner) {
        self.banner = banner
    }
}

extension HomeBannerViewModel {
    
    var imageURL: Observable<String> {
        return Observable<String>.just(banner.imageURL)
    }
    
    var id: Observable<String> {
        return Observable<Int>.just(banner.id).map { "\($0)" }
    }
}
