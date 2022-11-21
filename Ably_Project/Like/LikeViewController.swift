//
//  LikeViewController.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import UIKit
import SnapKit
import RxSwift

final class LikeViewController: UIViewController {
    
//    let infos: [Product] = Product.list
//    
//    static let id = "LikeCollectionView"
//    
//    private lazy var collectionView: UICollectionView! = nil
//
//    enum Section {
//        case main
//    }
//
//    typealias Item = Product
//    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
//    typealias DataSourceSnapShot = NSDiffableDataSourceSnapshot<Section, Item>
//
//    private var datasource: DataSource!
//    private var snapshot = DataSourceSnapShot()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.title = "좋아요"
//
//        self.configureCollectionViewLayout()
//        self.configureCollectionViewDataSource()
//        self.applySnapShot(item: self.infos)
//    }
//
//    private func configureCollectionViewDataSource() {
//
//        datasource = DataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
//
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeCell", for: indexPath) as? LikeCell else { return nil }
//
//            cell.configure(item)
//            return cell
//        })
//    }
//
//    private func applySnapShot(item: [Product]) {
//
//        snapshot = DataSourceSnapShot()
//        snapshot.appendSections([.main])
//        snapshot.appendItems(item, toSection: .main)
//        datasource.apply(snapshot)
//    }
//
//    private func layout() -> UICollectionViewCompositionalLayout {
//
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
//        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
//
//        let section = NSCollectionLayoutSection(group: group)
//
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
//    }
//
//    private func configureCollectionViewLayout() {
//
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout())
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        collectionView.backgroundColor = .systemBackground
//        collectionView.register(LikeCell.self, forCellWithReuseIdentifier: LikeCell.identifier)
//
//        view.addSubview(collectionView)
//    }
}
