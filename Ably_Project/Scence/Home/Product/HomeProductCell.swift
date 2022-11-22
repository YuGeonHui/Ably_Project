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
import RxCocoa

final class HomeProductCell: UICollectionViewCell {
    
    static let identifier = "HomeProductCell"
    
    private enum Metric {
        
        static let imageRadius: CGFloat = 5
        static let imageSize: CGSize = CGSize(width: 60, height: 60)
    }
    
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
        $0.layer.cornerRadius = Metric.imageRadius
    }
    
    private lazy var saleLabel = UILabel()
    private lazy var nameLabel = UILabel().then { $0.numberOfLines = 0 }
    private lazy var priceLabel = UILabel()
    private lazy var newBadgeLabel = UILabel()
    private lazy var sellCntLabel = UILabel()
    private lazy var heartIconView = UIImageView().then {
        $0.image = UIImage(systemName: "heart")
        $0.tintColor = .white
    }
    private lazy var dividerView = UIView().then {
        $0.backgroundColor = .systemGray6
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingViews()
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
        
        imageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(20)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        heartIconView.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(5)
        }
        
        saleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(5)
            make.leading.equalTo(imageView.snp.trailing).offset(20)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(saleLabel.snp.trailing).offset(5)
            make.top.equalTo(saleLabel.snp.top)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(saleLabel.snp.leading)
            make.top.equalTo(saleLabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().inset(20)
        }
        
        sellCntLabel.snp.makeConstraints { make in
            make.leading.equalTo(saleLabel.snp.leading)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().inset(20)
        }
        
        dividerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.top.equalTo(sellCntLabel.snp.bottom).offset(20)
        }
    }
    
    func configure(_ info: HomeProductViewInfo) {
        
        let saleRatio = info.price * 100 / info.actualPrice
        
        let url = URL(string: info.imageURL)
        self.imageView.kf.setImage(with: url)
        
        self.saleLabel.attributedText = "\(saleRatio)%".set(style: Styles.sale)
        self.nameLabel.attributedText = info.name.set(style: Styles.secondary)
        self.priceLabel.attributedText = "\(info.price)".set(style: Styles.primary)
        
        self.sellCntLabel.attributedText = "\(info.sellCnt)개 구매중".set(style: Styles.secondary)
    }
}

extension Reactive where Base: HomeProductCell {

//    var heartTap: ControlEvent<Void> {
//
//        let source = base
//
//        return ControlEvent(events: source)
//    }
}

