//
//  HomeViewController.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SnapKit

//enum MySection {
//    case first([Banner])
//    case second([Product])
//}

fileprivate enum Section {
    case first([Banner])
    case second([Product])
}

final class HomeViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let bannerInfos: [Banner] = Banner.list
    let productInfo: [Product] = Product.list
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = Self.getLayout()
        let config = UICollectionViewCompositionalLayoutConfiguration()
        
        layout.configuration = config
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = true
        view.contentInset = .zero
        view.backgroundColor = .systemBackground
        view.clipsToBounds = true
        
        view.register(HomeBannerCell.self, forCellWithReuseIdentifier: "HomeBannerCell")
        view.register(HomeProductCell.self, forCellWithReuseIdentifier: "HomeProductCell")
       
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var viewModel: HomeViewModel!
  
//    private let dataSource: [MySection] = [.first(Banner.list), .second(Product.list)]

    fileprivate var dataSource: [Section] = [.first(Banner.list), .second(Product.list)]
    
    static func getLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { (section, env) -> NSCollectionLayoutSection? in
            switch section {
            case 0:
                
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(50)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(50)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
                return section
                
            default:
                
                // Item
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .estimated(50)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(50)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        self.title = "홈" 
        
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        self.collectionView.dataSource = self
        self.getFetchInfo()
    }
}

extension HomeViewController {
    
    private func getFetchInfo() {
        
        let resource = Resource<HomeResponse>(url: URL(string: "https://d2bab9i9pr8lds.cloudfront.net/api/home")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { response in
                
                self.dataSource = [.first(response.banners), .second(response.products)]
                
//                let banners = response.banners
//                let products = response.products
//                self.viewModel = HomeViewModel(banners, products: products)
//
//                debugPrint("12312: \(banners)")
//                debugPrint("12312: \(products)")
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            }).disposed(by: disposeBag)
    }
}

// MARK: Delegate
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.dataSource[section] {
        case let .first(items):
            return items.count
        case let .second(items):
            return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCell", for: indexPath) as! HomeBannerCell
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCell", for: indexPath) as! HomeProductCell
        
        switch self.dataSource[indexPath.section] {
        case let .first(items):
            
            bannerCell.configure(items[indexPath.item])
            return bannerCell
            
        case let .second(items):

            productCell.configure(items[indexPath.item])
            return productCell
        }
    }
}

// let bannerVM = self.viewModel.bannerAt(indexPath.row)
//
//        bannerVM.imageURL
//            .withUnretained(self)
//            .bind(onNext: { cell.uploadImageURL.accept($0.1) })
//            .disposed(by: self.disposeBag)
//
//        bannerVM.id
//            .withUnretained(self)
//            .bind(onNext: { cell.uploadState.accept($0.1) })
//            .disposed(by: self.disposeBag)
