//
//  HomeViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel: RxViewModel {
    
    let bannerViewModel: [HomeBannerViewModel]
//    let productViewModel: [HomeProductViewModel]
    
    init(_ banners: [Banner], products: [Product]) {
        
        self.bannerViewModel = banners.compactMap(HomeBannerViewModel.init)
//        self.productViewModel = products.compactMap(HomeProductViewModel.init)
    }
    
    private let _fetch = PublishRelay<Void>()
    func fetch() {
        self._fetch.accept(())
    }
    
    override func bind() {
        
        _fetch
            .withUnretained(self)
            .bind(onNext: { $0.0.getFetchInfo() })
            .disposed(by: self.disposeBag)
    }
    
    private func getFetchInfo() {
        
        let resource = Resource<HomeResponse>(url: URL(string: "https://d2bab9i9pr8lds.cloudfront.net/api/home")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { response in
                
                let banners = response.banners
                let products = response.products
                                
            }).disposed(by: disposeBag)
    }
}

extension HomeViewModel {
    
    func bannerAt(_ index: Int) -> HomeBannerViewModel {
        return self.bannerViewModel[index]
    }
}

