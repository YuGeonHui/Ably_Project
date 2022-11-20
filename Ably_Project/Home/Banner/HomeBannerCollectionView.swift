//
//  HomeBannerCollectionView.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class HomeBannerCollectionView: UICollectionView {
    
    static let id = "HomeBannerCollectionView"
    
    let bannerInfos: [Banner] = Banner.list
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        showsHorizontalScrollIndicator = false
        register(HomeBannerCell.self, forCellWithReuseIdentifier: HomeBannerCell.identifier)
        dataSource = self
        delegate = self
    }
}

extension HomeBannerCollectionView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerInfos.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCell.identifier, for: indexPath) as? HomeBannerCell else {
            return UICollectionViewCell()
        }
        
        let item = bannerInfos[indexPath.item]
        cell.configure(item)
        return cell
    }
}

extension HomeBannerCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.photosCellWidth, height: Constants.photosCellHeight)
    }
}
