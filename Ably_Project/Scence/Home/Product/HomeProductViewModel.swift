//
//  HomeProductViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

// MARK: Product ViewModel
struct HomeProductViewInfo {
    
    var id: Int
    var name: String
    var imageURL: String
    
    var actualPrice: Int
    var price: Int
    
    var isNew: Bool
    var sellCnt: Int
}

protocol HomeProductViewModelInputs {
    
    func heartTapped()
}

protocol HomeProductViewModelOutputs {
    
    var showProductInfo: Observable<HomeProductViewInfo> { get }
}

class HomeProductViewModel: HomeProductViewModelInputs, HomeProductViewModelOutputs {
    
    let disposeBag = DisposeBag()
    
    private var _heartTapped = PublishRelay<Void>()
    func heartTapped() {
        self._heartTapped.accept(())
    }
    
    private let _showProductInfo = PublishRelay<HomeProductViewInfo>()
    var showProductInfo: Observable<HomeProductViewInfo>
    
    init(with viewInfo: HomeProductViewInfo) {
        
        self.showProductInfo = self._showProductInfo.asObservable()
        self.bind()
    }
    
    func bind() {
        
    }
}
