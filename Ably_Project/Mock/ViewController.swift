//
//  ViewController.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation

import UIKit

//final class ViewController: UIViewController {
//    
////    let productInfo: [Product] = Product.list
//    let bannerInfos: [Banner] = Banner.list
//    
//    private lazy var collectionView: UICollectionView = {
//        
//        let layout = Self.getLayout()
//        let config = UICollectionViewCompositionalLayoutConfiguration()
//        
//        layout.configuration = config
//        
//        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        view.isScrollEnabled = true
//        view.showsHorizontalScrollIndicator = false
//        view.showsVerticalScrollIndicator = true
//        view.contentInset = .zero
//        view.backgroundColor = .clear
//        view.clipsToBounds = true
//        view.register(LikeCell.self, forCellWithReuseIdentifier: "LikeCell")
//        
//        view.register(HomeBannerCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HomeBannerCell")
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    static func getLayout() -> UICollectionViewCompositionalLayout {
//        UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
//            
//            // Item
//            let itemSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .estimated(50)
//            )
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//            
//            // Group
//            let groupSize = NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .estimated(50)
//            )
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
//            group.edgeSpacing = NSCollectionLayoutEdgeSpacing(
//                leading: .flexible(0),
//                top: nil,
//                trailing: nil,
//                bottom: nil
//            )
//            
//            // Section
//            let section = NSCollectionLayoutSection(group: group)
//            
//            // header / footer
//            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250))
//            let header = NSCollectionLayoutBoundarySupplementaryItem(
//                layoutSize: headerFooterSize,
//                elementKind: UICollectionView.elementKindSectionHeader,
//                alignment: .top
//            )
//            section.boundarySupplementaryItems = [header]
//            return section
//        }
//    }
//    
//    override func viewDidLoad() {
//        
//        super.viewDidLoad()
//        self.view.addSubview(self.collectionView)
//        
//        NSLayoutConstraint.activate([
//            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
//        ])
//        self.collectionView.dataSource = self
//    }
//}
//
//extension ViewController: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return productInfo.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LikeCell", for: indexPath) as? LikeCell else { return UICollectionViewCell() }
//        
//        let item = productInfo[indexPath.item]
//        cell.configure(item)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        switch kind {
//            
//        case UICollectionView.elementKindSectionHeader:
//            
//            let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeBannerCell", for: indexPath) as! HomeBannerCell
//            
//            let item = bannerInfos[indexPath.item]
//            cell.configure(item)
//            return cell
//            
////            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HomeBannerCell", for: indexPath) as! HomeBannerCell]
////            return header
//            
//        default:
//            return UICollectionReusableView()
//        }
//    }
//    
//}
