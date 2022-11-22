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

fileprivate enum Section {
    case banner([HomeBannerViewInfo])
    case product([HomeProductViewInfo])
}

final class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    let disposeBag = DisposeBag()
    
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
       
        return view
    }()
    
    // MARK: ViewModel
    private var viewModel = HomeViewModel()
    fileprivate var dataSource: [Section]!
    
    // MARK: Refresh
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = Main.TabItem.home.title
    
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.refreshControl.endRefreshing()
        self.collectionView.refreshControl = refreshControl
        
        self.settingView()
        self.bindView()
    }
    
    private func settingView() {
        
        self.view.addSubview(self.collectionView)
        
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func bindView() {
        
        self.bindInputs(self.viewModel)
        self.bindOutputs(self.viewModel)
        
        self.refreshControl.rx.controlEvent(.valueChanged)
            .observe(on: MainScheduler.instance)
            .withUnretained(self)
            .bind(onNext: { [weak self] _ in

                self?.viewModel.fetch()

                DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                    self?.refreshControl.endRefreshing()
                }
            })
            .disposed(by: self.disposeBag)
    }
    
    private func bindInputs(_ inputs: HomeViewModelInputs) {
        inputs.fetch()
    }
    
    private func bindOutputs(_ outputs: HomeViewModelOutputs) {
        
        outputs.viewInfoChanged
            .observe(on: MainScheduler.instance)
            .withUnretained(self)
            .bind(onNext: { $0.updateView(with: $1) })
            .disposed(by: self.disposeBag)
        
        outputs.addProdcutInfoChanged
            .observe(on: MainScheduler.instance)
            .withUnretained(self)
            .bind(onNext: { $0.addProductView(with: $1) })
            .disposed(by: self.disposeBag)
    }
}

// MARK: Extensions of updates
fileprivate extension HomeViewController {
    
    private func updateView(with viewInfo: HomeViewInfo) {
        
        let bannerInfo = viewInfo.bannerInfos
        let productInfo = viewInfo.productInfos
        
        self.dataSource = [.banner(bannerInfo), .product(productInfo)]
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    private func addProductView(with viewInfo: HomeProductViewInfo) {
        
    }
}

// MARK: Extensions of Layout
extension HomeViewController {
    
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
}

// MARK: Extensions of Delegate with Data
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.dataSource[section] {
            
        case let .banner(items):
            return items.count
        case let .product(items):
            return items.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeBannerCell", for: indexPath) as! HomeBannerCell
        let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeProductCell", for: indexPath) as! HomeProductCell
        
        switch self.dataSource[indexPath.section] {
        case let .banner(items):

            bannerCell.configure(items[indexPath.item], totalCount: items.count)
            return bannerCell
            
        case let .product(items):

            productCell.configure(items[indexPath.item])
            return productCell
        }
    }
}

// MARK: Extensions of Delegate with Scroll
extension HomeViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                
        let position = scrollView.contentOffset.y
        if position > self.collectionView.contentSize.height - 100 - scrollView.frame.size.height {
            
//            self.dataSource = [.banner(<#T##[HomeBannerViewInfo]#>)]
            
            debugPrint("!2313: \(self.dataSource.count)")
        }
    }   
}
