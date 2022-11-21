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
    
    var image: UIImage?
    
    var price: Int
    var sale: String
    var name: String
    
    var sellCnt: String
    var isNew: Bool
}

protocol HomeProductViewModelInputs {
    
    func heartTapped()
}

protocol HomeProductViewModelOutputs {
    
    var showProductInfo: Observable<HomeProductViewInfo> { get }
}

class HomeProductViewModel: RxViewModel, HomeProductViewModelInputs, HomeProductViewModelOutputs {
    
    private var _heartTapped = PublishRelay<Void>()
    func heartTapped() {
        self._heartTapped.accept(())
    }
    
    private let _showProductInfo = PublishRelay<HomeProductViewInfo>()
    var showProductInfo: Observable<HomeProductViewInfo>
    
    init(with viewInfo: HomeProductViewInfo) {
        
        self.showProductInfo = self._showProductInfo.asObservable()
    }
    
    override func bind() {
        
    }
}
