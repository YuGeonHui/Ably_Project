//
//  TextViewController.swift
//  Ably_Project
//
//  Created by geonhui Yu on 2022/11/20.
//

import UIKit
import SnapKit

enum Constants {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
    static let photosCellWidth = width
    static let photosCellHeight = photosCellWidth / 1.5
}


class CollectionViewCell: UICollectionViewCell {
    
    var view = UIView()
    
    func setupCell(view: UIView) {
        self.view = view
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        backgroundColor = .blue
    }
}

//class CollectionViewController: UICollectionViewController {
//    
//    private lazy var bannerCollectionView = HomeBannerCollectionView()
//    private lazy var productCollectionView = LikeCollectionView()
//    
//    private lazy var cells: [(view: UIView, id: String)] = [
////        (bannerCollectionView, HomeBannerCollectionView.id),
//        (productCollectionView, LikeCollectionView.id)
//    ]
//    
//    init() {
//        
//        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        super.init(collectionViewLayout: layout)
//        
//        self.setupCollectionView()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    
//    private func setupCollectionView() {
//        cells.forEach { collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: $0.id) }
//        collectionView.register(HomeBannerCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeBannerCell.identifier)
//    }
//}
//
//extension CollectionViewController {
//    
//    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return cells.count
//    }
//    
//    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cells[indexPath.row].id, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
//        cell.setupCell(view: cells[indexPath.row].view)
//        return cell
//    }
//}
//
//extension CollectionViewController: UICollectionViewDelegateFlowLayout {
//    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        switch kind {
//        case UICollectionView.elementKindSectionHeader:
//            
//            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeBannerCell.identifier, for: indexPath)
//            return header
//            
//        default:
//            return UICollectionReusableView()
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        CGSize(width: UIScreen.main.bounds.width, height: 200)
//    }
//}
