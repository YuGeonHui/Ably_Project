//
//  HomeViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeViewInfo {
    
    var bannerInfos: [HomeBannerViewInfo] = []
    var productInfos: [HomeProductViewInfo] = []
    
    init() {
        
        self.bannerInfos = []
        self.productInfos = []
    }
    
    fileprivate init(fetchResult: HomeResponse) {
        
        let result = fetchResult
        
        self.bannerInfos = result.banners.map { HomeBannerViewInfo(id: $0.id, imageURL: $0.imageURL) }
        self.productInfos = result.products.map {
            HomeProductViewInfo(id: $0.id, name: $0.name, imageURL: $0.imageURL, actualPrice: $0.actualPrice, price: $0.price, isNew: $0.isNew, sellCnt: $0.sellCnt)
        }
    }
}

protocol HomeViewModelInputs {
    
    func fetch()
}

protocol HomeViewModelOutputs {
    
    var viewInfoChanged: Observable<HomeViewInfo> { get }
}

class HomeViewModel: HomeViewModelInputs, HomeViewModelOutputs {
    
    let disposeBag = DisposeBag()
    
    // MARK: Inputs
    private let _fetch = PublishRelay<Void>()
    func fetch() {
        self._fetch.accept(())
    }
    
    // MARK: Value
    private let _viewInfo = BehaviorRelay<HomeViewInfo>(value: HomeViewInfo())
    var viewInfoChanged: Observable<HomeViewInfo>
    
    init() {
        
        self.viewInfoChanged = _viewInfo.asObservable()
        self.bind()
    }
    
    func bind() {
        
        self._fetch
            .withUnretained(self)
            .bind(onNext: { $0.0.fetchInfos() })
            .disposed(by: self.disposeBag)
    }
    
    private func fetchInfos() {
        
        let resource = Resource<HomeResponse>(url: URL(string: "https://d2bab9i9pr8lds.cloudfront.net/api/home")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { [weak self] in
                
                let info = HomeViewInfo(fetchResult: $0)
                self?._viewInfo.accept(info)
                
            }, onError: { [weak self] err in
                
                debugPrint(err.localizedDescription)
                let info = HomeViewInfo()
                self?._viewInfo.accept(info)
            })
            .disposed(by: disposeBag)
    }
}



//class HomeViewModel: RxViewModel {
//
//    let bannerViewModel: [HomeBannerViewModel]
////    let productViewModel: [HomeProductViewModel]
//
//    init(_ banners: [Banner], products: [Product]) {
//
//        self.bannerViewModel = banners.compactMap(HomeBannerViewModel.init)
////        self.productViewModel = products.compactMap(HomeProductViewModel.init)
//    }
//
//    private let _fetch = PublishRelay<Void>()
//    func fetch() {
//        self._fetch.accept(())
//    }
//
//    override func bind() {
//
//        _fetch
//            .withUnretained(self)
//            .bind(onNext: { $0.0.getFetchInfo() })
//            .disposed(by: self.disposeBag)
//    }
//
//    private func getFetchInfo() {
//
//        let resource = Resource<HomeResponse>(url: URL(string: "https://d2bab9i9pr8lds.cloudfront.net/api/home")!)
//
//        URLRequest.load(resource: resource)
//            .subscribe(onNext: { response in
//
//                let banners = response.banners
//                let products = response.products
//
//            }).disposed(by: disposeBag)
//    }
//}
//
//extension HomeViewModel {
//
//    func bannerAt(_ index: Int) -> HomeBannerViewModel {
//        return self.bannerViewModel[index]
//    }
//}

