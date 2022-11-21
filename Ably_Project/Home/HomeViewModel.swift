//
//  HomeViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeViewModel {
    
    let bannerViewModel: [HomeBannerViewModel]
    
    init() {
        self.bannerViewModel = []
    }
    
    init(_ banners: [Banner]) {
        
        self.bannerViewModel = banners.compactMap(HomeBannerViewModel.init)
    }
}

extension HomeViewModel {
    
    func bannerAt(_ index: Int) -> HomeBannerViewModel {
        return self.bannerViewModel[index]
    }
}

class HomeBannerViewModel  {
    
    let banner: Banner
    
    init(_ banner: Banner) {
        self.banner = banner
    }
    
    private let _fetch = PublishRelay<Void>()
    func fetch() {
        self._fetch.accept(())
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

