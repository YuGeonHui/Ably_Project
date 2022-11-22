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
            HomeProductViewInfo(fetchResult: $0)
        }
    }
}

protocol HomeViewModelInputs {
    
    func fetch()
    func fetchMoreInfo(_ lastId: Int)
}

protocol HomeViewModelOutputs {
    
    var viewInfoChanged: Observable<HomeViewInfo> { get }
    var addProdcutInfoChanged: Observable<HomeProductViewInfo> { get }
}

class HomeViewModel: HomeViewModelInputs, HomeViewModelOutputs {
    
    let disposeBag = DisposeBag()
    
    // MARK: Inputs
    private let _fetch = PublishRelay<Void>()
    func fetch() {
        self._fetch.accept(())
    }
    
    private let _fetchMoreInfo = PublishRelay<Int>()
    func fetchMoreInfo(_ lastId: Int) {
        self._fetchMoreInfo.accept(lastId)
    }
    
    // MARK: Value
    private let _viewInfo = BehaviorRelay<HomeViewInfo>(value: HomeViewInfo())
    var viewInfoChanged: Observable<HomeViewInfo>
    
    private let _addProductInfo = BehaviorRelay<HomeProductViewInfo>(value: HomeProductViewInfo())
    var addProdcutInfoChanged: Observable<HomeProductViewInfo>
    
    init() {
        
        self.viewInfoChanged = _viewInfo.asObservable()
        self.addProdcutInfoChanged = _addProductInfo.asObservable()
        
        self.bind()
    }
    
    func bind() {
        
        self._fetch
            .withUnretained(self)
            .bind(onNext: { $0.0.fetchInfos() })
            .disposed(by: self.disposeBag)
        
        self._fetchMoreInfo
            .distinctUntilChanged()
            .withUnretained(self)
            .bind(onNext: { $0.pagination($1) })
            .disposed(by: self.disposeBag)
    }
    
    private func fetchInfos() {
        
        let resource = Resource<HomeResponse>(url: URL(string: HomeAPI.initialization.url)!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { [weak self] response in
                
                let info = HomeViewInfo(fetchResult: response)
                self?._viewInfo.accept(info)
                
            }, onError: { [weak self] err in
                
                debugPrint(err.localizedDescription)
                let info = HomeViewInfo()
                self?._viewInfo.accept(info)
            })
            .disposed(by: disposeBag)
    }
    
    private func pagination(_ lastId: Int) {

        let resource = Resource<ProductResponse>(url: URL(string: HomeAPI.pagination(lastId).url)!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { [weak self] response in
                                
                let info = HomeProductViewInfo(fetchResult: response)
                self?._addProductInfo.accept(info)
                
            }, onError: { [weak self] err in
                
                debugPrint(err.localizedDescription)
                
                let info = HomeProductViewInfo()
                self?._addProductInfo.accept(info)
            })
            .disposed(by: disposeBag)
    }
}
