//
//  LikeCell.swift
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

final class LikeCell: UICollectionViewCell {
    
    static let identifier = "LikeCell"
    
    private enum Styles {
        
        static let primary: Style = Style {
            $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            $0.color = UIColor.black
        }
        
        static let secondary: Style = Style {
            $0.font = UIFont.systemFont(ofSize: 13, weight: .regular)
            $0.color = Color.secondary
        }
        
        static let sale: Style = Style {
            $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            $0.color = Color.sale
        }
    }
    
    private enum Color {
        
        static let sale: UIColor = UIColor(red: 236.0 / 255.0, green: 94.0 / 255.0, blue: 101.0 / 255.0, alpha: 1.0)
        static let secondary: UIColor = UIColor(red: 119.0 / 255.0, green: 119.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
    }
    
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    
    private lazy var saleLabel = UILabel()
    private lazy var nameLabel = UILabel().then { $0.numberOfLines = 0 }
    private lazy var priceLabel = UILabel()
    private lazy var newBadgeLabel = UILabel()
    private lazy var sellCntLabel = UILabel()
    private lazy var heartIconView = UIImageView().then {
        $0.image = UIImage(systemName: "heart")
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
    }
    
    func configure(_ info: Product) {
        
        let saleRatio = info.actualPrice * 100 / info.price
        
        let url = URL(string: info.imageURL)
        imageView.kf.setImage(with: url)
        
        self.saleLabel.attributedText = "\(saleRatio)%".set(style: Styles.sale)
        self.nameLabel.attributedText = info.name.set(style: Styles.secondary)
        self.priceLabel.attributedText = "\(info.price)".set(style: Styles.primary)
        
        self.sellCntLabel.attributedText = "\(info.sellCnt)개 구매중".set(style: Styles.secondary)
    }
}
