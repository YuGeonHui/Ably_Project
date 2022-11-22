//
//  HomeProductCell.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/19.
//

import Foundation
import UIKit
import SnapKit
import Then
import Kingfisher
import SwiftRichString
import RxSwift
import RxGesture
import RxCocoa

final class HomeProductCell: UICollectionViewCell {
    
    let disposeBag = DisposeBag()
    static let identifier = "HomeProductCell"
    
    private enum Styles {
        
        static let primary: Style = Style {
            $0.font = UIFont.bold18
            $0.color = UIColor.black
        }
        
        static let sale: Style = Style {
            $0.font = UIFont.bold18
            $0.color = UIColor.xec5e65
        }
        
        static let secondary: Style = Style {
            $0.font = UIFont.regular13
            $0.color = UIColor.x777777
        }
    }
    
    fileprivate lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    private lazy var saleLabel = UILabel()
    private lazy var nameLabel = UILabel().then { $0.numberOfLines = 0 }
    private lazy var priceLabel = UILabel()
    private lazy var newBadgeLabel = PaddingLabel().then {
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.cornerRadius = 2
    }
    private lazy var sellCntLabel = UILabel()
    private lazy var heartIconView = UIImageView().then {
        $0.image = UIImage(systemName: "heart")
        $0.tintColor = .white
    }
    private lazy var dividerView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    private var isLikeItem: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingViews()
        self.bindView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingViews() {
        
        self.addSubview(self.imageView)
        self.imageView.addSubview(self.heartIconView)
        
        self.addSubview(self.saleLabel)
        self.addSubview(self.nameLabel)
        self.addSubview(self.priceLabel)
        
        self.addSubview(self.newBadgeLabel)
        self.addSubview(self.sellCntLabel)
        self.addSubview(self.dividerView)
        
        self.imageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        
        self.heartIconView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(5)
        }
        
        self.saleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(20)
        }
        
        self.priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(saleLabel.snp.trailing).offset(5)
            make.top.equalTo(saleLabel.snp.top)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(saleLabel.snp.leading)
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(20)
        }
        
        self.newBadgeLabel.snp.makeConstraints { make in
            make.leading.equalTo(saleLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(20)
        }
        
        self.sellCntLabel.snp.makeConstraints { make in
            make.leading.equalTo(newBadgeLabel.snp.trailing).offset(5)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(20)
        }
        
        self.dividerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(sellCntLabel.snp.bottom).offset(20)
        }
    }
    
    func configure(_ info: HomeProductViewInfo) {
        
        var saleRatio = 0
        if info.actualPrice != info.price {
            saleRatio = info.price / (info.actualPrice - info.price)
        }
        self.saleLabel.attributedText = "\(saleRatio)%".set(style: Styles.sale)
        
        let url = URL(string: info.imageURL)
        self.imageView.kf.setImage(with: url)
        
        self.nameLabel.attributedText = info.name.set(style: Styles.secondary)
        self.priceLabel.attributedText = "\(info.price)".set(style: Styles.primary)
        
        if info.sellCnt > 10 {
            self.sellCntLabel.attributedText = "\(info.sellCnt)개 구매중".set(style: Styles.secondary)
        }
    
        if info.isNew {
           
            self.newBadgeLabel.attributedText = "new".set(style: Styles.secondary)
            
        } else {
            
            self.newBadgeLabel.isHidden = true
            self.sellCntLabel.snp.makeConstraints { make in
                make.leading.equalTo(saleLabel.snp.leading)
            }
        }
    }
    
    private func bindView() {
        
        self.imageView.rx.tapGesture()
            .when(.recognized)
            .throttle(.microseconds(200), latest: false, scheduler: MainScheduler.instance)
            .withUnretained(self)
            .map { ($0.0, $0.0.isLikeItem) }
            .bind(onNext: {
                $0.heartIconView.image = $0.updateHeartView($1)
                $0.isLikeItem.toggle()
            })
            .disposed(by: self.disposeBag)
    }
    
    private func updateHeartView(_ isLike: Bool) -> UIImage? {
        
        let normalImg = UIImage(systemName: "heart")
        let fillImg = UIImage(systemName: "heart.fill")?.withRenderingMode(.alwaysOriginal)
        
        return isLike ? fillImg : normalImg
    }
}
