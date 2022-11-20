//
//  LikeCollectionView.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import SnapKit
import UIKit
import SwiftRichString

//final class LikeCollectionView: UICollectionView {
//
//    static let id = "LikeCollectionView"
//
//    let productInfo: [Product] = Product.list
//
//    init() {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 3
//        super.init(frame: .zero, collectionViewLayout: layout)
//        setupView()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupView() {
//        showsHorizontalScrollIndicator = false
//        register(LikeCell.self, forCellWithReuseIdentifier: LikeCell.identifier)
//        dataSource = self
//        delegate = self
//    }
//}
//
//extension LikeCollectionView: UICollectionViewDataSource {
//
//    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return productInfo.count
//    }
//
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LikeCell.identifier, for: indexPath) as? LikeCell else {
//            return UICollectionViewCell()
//        }
//
//        let item = productInfo[indexPath.item]
//        cell.configure(item)
//        return cell
//    }
//}
//
//extension LikeCollectionView: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: Constants.photosCellWidth, height: Constants.photosCellHeight)
//    }
//}
//



