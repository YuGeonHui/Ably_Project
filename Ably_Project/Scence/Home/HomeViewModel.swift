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
    let productViewModel: [HomeProductViewModel]
    
    init(_ banners: [Banner], products: [Product]) {
        
        self.bannerViewModel = banners.compactMap(HomeBannerViewModel.init)
        self.productViewModel = products.compactMap(HomeProductViewModel.init)
    }
    
    private let _fetch = PublishRelay<Void>()
    func fetch() {
        self._fetch.accept(())
    }
}

extension HomeViewModel {
    
    func bannerAt(_ index: Int) -> HomeBannerViewModel {
        return self.bannerViewModel[index]
    }
}

// MARK: Banner ViewModel
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

// MARK: Product ViewModel
class HomeProductViewModel {
    
    let product: Product
    
    init(_ product: Product) {
        self.product = product
    }
}

extension HomeProductViewModel {
    
    
}
