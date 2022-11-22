//
//  LikeViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

protocol LikeViewModelOutputs {
    
    var viewInfoChanged: Observable<HomeProductViewInfo> { get }
}

