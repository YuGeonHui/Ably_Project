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

final class HomeBannerCell: UICollectionViewCell {
    
    static let identifier = "HomeBannerCell"
    
    private enum Styles {
        static let state: Style = Style {
            $0.font = UIFont.systemFont(ofSize: 8, weight: .regular)
            $0.color = UIColor.white
        }
    }
    
    private lazy var imageView = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    private lazy var stateLabel = UILabel()
    
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
            make.bottom.right.equalToSuperview().inset(10)
        }
    }
        
    func configure(_ info: Banner) {
                
        guard let url = URL(string: info.imageURL) else { return }
        imageView.kf.setImage(with: url)
        
        stateLabel.attributedText = "\(info.id)".set(style: Styles.state)
    }
}
