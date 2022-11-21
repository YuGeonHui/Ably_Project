//
//  HomeViewController.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/19.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

//final class HomeViewController: UIViewController {
    
//    let bannerInfos: [Banner] = Banner.list
//    
//    private var bannerView: UICollectionView! = nil
//    
//    enum Section {
//        case banner
//        case product
//    }
//    
//    typealias Item = Banner
//    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
//    typealias DataSourceSnapShot = NSDiffableDataSourceSnapshot<Section, Item>
//    
//    private var datasource: DataSource!
//    private var snapshot = DataSourceSnapShot()
// 
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.title = "홈"
//        
//        configureCollectionViewLayout()
//        configureCollectionViewDataSource()
//        applySnapShot(item: self.bannerInfos)
//    }
//    
//    private func configureCollectionViewDataSource() {
//        
//        datasource = DataSource(collectionView: bannerView, cellProvider: { collectionView, indexPath, item in
//            
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCell", for: indexPath) as? HomeBannerCell else { return nil }
//            
//            cell.configure(item)
//            return cell
//        })
//    }
//    
//    private func applySnapShot(item: [Banner]) {
//        
//        snapshot = DataSourceSnapShot()
//        snapshot.appendSections([.banner])
//        snapshot.appendItems(item, toSection: .banner)
//        datasource.apply(snapshot)
//    }
//    
//    private func bannerLayout() -> UICollectionViewCompositionalLayout {
//        
//        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .paging
//
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        return layout
//    }
//    
//    private func configureCollectionViewLayout() {
//        
//        bannerView = UICollectionView(frame: view.bounds, collectionViewLayout: bannerLayout())
//        bannerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        bannerView.backgroundColor = .systemBackground
//        bannerView.register(HomeBannerCell.self, forCellWithReuseIdentifier: HomeBannerCell.identifier)
//        
//        view.addSubview(bannerView)
//    }
//}
