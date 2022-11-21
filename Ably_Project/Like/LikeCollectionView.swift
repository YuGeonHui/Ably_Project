//
//  LikeViewController.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/19.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class LikeCollectionView: UICollectionView {
    
    static let id = "HomeBannerCollectionView"
    
    let infos: [Product] = Product.list
    
    init() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        showsHorizontalScrollIndicator = false
        register(LikeCell.self, forCellWithReuseIdentifier: LikeCell.identifier)
        dataSource = self
        delegate = self
    }
}

extension LikeCollectionView: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infos.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikeCell.identifier, for: indexPath) as? LikeCell else {
            return UICollectionViewCell()
        }
        
        let item = infos[indexPath.item]
        cell.configure(item)
        return cell
    }
}

extension LikeCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.photosCellWidth, height: Constants.photosCellHeight)
    }
}

