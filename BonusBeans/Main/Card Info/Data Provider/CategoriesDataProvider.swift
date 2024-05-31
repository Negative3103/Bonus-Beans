//
//  CategoriesDataProvider.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class CategoriesDataProvider: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Outlets
    weak var collectionView: UICollectionView! {
        didSet {
            let layout = CenterAlignedCollectionViewFlowLayout()
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            collectionView.collectionViewLayout = layout
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    //MARK: - Attributes
    weak var viewController: UIViewController?
    internal var items = [CategoriesModel]() {
        didSet {
            collectionView(collectionView, didSelectItemAt: IndexPath(row: 0, section: 0))
            collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycles
    init(viewController: UIViewController? = nil) {
        self.viewController = viewController
    }
    
    //MARK: - Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewController = viewController as? CardInfoViewController else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.defaultReuseIdentifier, for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell() }
        cell.item = items[indexPath.row]
        cell.didSelect = items[indexPath.row].id == viewController.selectedCategory?.id
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewController = viewController as? CardInfoViewController else { return }
        viewController.selectedCategory = items[indexPath.row]
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let width = items[indexPath.row].title?.width(withConstrainedHeight: collectionView.frame.height, font: UIFont.AppFonts.AvenirNextMedium.withSize(18)) else { return .zero }
        return CGSize(width: width, height: collectionView.frame.height)
    }
}
