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
    
    private enum Constants {
        static let width = UIScreen.main.bounds.width
        
        static let height: CGFloat = 250
        
        static let labelRadius: CGFloat = 10
        static let labelInset: Int = 20
    }
    
    private enum Styles {
        static let state: Style = Style {
            $0.font = UIFont.regular12
            $0.color = UIColor.white
        }
    }
    
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private lazy var stateLabel = PaddingLabel().then {
        $0.clipsToBounds = true
        $0.layer.cornerRadius = Constants.labelRadius
        $0.backgroundColor = .systemGray2
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
        self.addSubview(self.stateLabel)
        
        snp.makeConstraints { make in
            make.width.equalTo(Constants.width)
        }
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(Constants.height)
        }
        
        stateLabel.snp.makeConstraints { make in
            make.bottom.right.equalToSuperview().inset(Constants.labelInset)
        }
    }
        
    func configure(_ info: HomeBannerViewInfo, totalCount: Int) {
                
        guard let url = URL(string: info.imageURL) else { return }
        self.imageView.kf.setImage(with: url)
        
        self.stateLabel.attributedText = "\(info.id) / \(totalCount)".set(style: Styles.state)
        self.stateLabel.invalidateIntrinsicContentSize()
    }
    
}
