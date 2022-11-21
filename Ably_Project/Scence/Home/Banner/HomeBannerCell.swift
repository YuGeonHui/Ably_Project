//
//  HomeBannerCell.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import SnapKit
import Then
import Kingfisher
import SwiftRichString
import RxRelay
import RxSwift
import RxCocoa

final class HomeBannerCell: UICollectionViewCell {
    
    let disposeBag = DisposeBag()
    static let identifier = "HomeBannerCell"
    
    private enum Styles {
        static let state: Style = Style {
            $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            $0.color = UIColor.white
        }
    }
    
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    lazy var stateLabel = UILabel().then {
        $0.layer.cornerRadius = 4
        $0.clipsToBounds = true
        $0.backgroundColor = .gray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.settingCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingCell() {
        
        self.addSubview(self.imageView)
        imageView.addSubview(self.stateLabel)
        
        snp.makeConstraints { make in
            make.width.equalTo(Constants.width)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(250)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(20)
        }
    }
        
    func configure(_ info: Banner) {
                
        guard let url = URL(string: info.imageURL) else { return }
        imageView.kf.setImage(with: url)
        
        stateLabel.attributedText = "\(info.id) / 3".set(style: Styles.state)
    }
    
    let uploadImageURL = PublishRelay<String>()
    let uploadState = PublishRelay<String>()
    
    private func bindView() {
        
        self.uploadImageURL
            .map { URL(string: $0) }
            .withUnretained(self)
            .bind(onNext: { $0.0.imageView.kf.setImage(with: $0.1) })
            .disposed(by: self.disposeBag)
        
        self.uploadState
            .withUnretained(self)
            .bind(onNext: { $0.0.stateLabel.text = $0.1 })
            .disposed(by: self.disposeBag)
    }
}
