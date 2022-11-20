//
//  RxViewModel.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import RxSwift

protocol RxViewModelType {
    
    var disposeBag: DisposeBag { get set }
    
    func bind()
    func unbind()
}

class RxViewModel: RxViewModelType {
    
    var disposeBag = DisposeBag()
    
    
    func bind() {
        
    }
    
    
    func unbind() {
        self.disposeBag = DisposeBag()
    }
    
}
