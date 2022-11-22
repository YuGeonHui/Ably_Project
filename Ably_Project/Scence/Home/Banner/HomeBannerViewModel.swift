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

fileprivate typealias _ViewInfo = HomeBannerViewInfo
struct HomeBannerViewInfo {
    
    var id: Int
    var imageURL: String?
}

protocol HomeBannerViewOutputs {
    
    var id: Observable<Int> { get }
    var imageURL: Observable<String?> { get }
}

class HomeBannerViewModel: RxViewModel, HomeBannerViewOutputs  {
    
    // MARK: OutPuuts
    var id: Observable<Int>
    var imageURL: Observable<String?>
    
    // MARK: Values
    private let _viewInfo: BehaviorRelay<_ViewInfo>
    
    init(with viewInfo: HomeBannerViewInfo) {
        
        self._viewInfo = BehaviorRelay<_ViewInfo>(value: viewInfo)
        
        self.id = self._viewInfo.map { $0.id }.asObservable()
        self.imageURL = self._viewInfo.map { $0.imageURL }.asObservable()
    }
    
    override func bind() {
        
    }
}
