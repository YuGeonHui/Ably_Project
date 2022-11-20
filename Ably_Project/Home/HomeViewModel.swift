//
//  HomeViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import RxSwift
import RxCocoa

struct HomeBannerViewInfo {
    
    var bannerImageURL: String?
    var bannerId: Int?
    var bannerTotalCnt: Int?
}

protocol HomeViewModelInputs {
    
    func reload()
    func tappedHeart()
}

protocol HomeViewModelOutputs {
    
}

//final class HomeViewModel: RxViewModel,  {
//    
//}
