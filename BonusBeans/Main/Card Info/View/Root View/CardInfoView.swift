//
//  CardInfoView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class CardInfoView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var reviewView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var commentsCollectionView: UICollectionView! {
        didSet {
            commentsCollectionView.register(UINib(nibName: CommentsCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CommentsCollectionViewCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var categoriesCollectionView: UICollectionView! {
        didSet {
            categoriesCollectionView.register(UINib(nibName: CategoriesCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: CategoriesCollectionViewCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: ReviewCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ReviewCollectionViewCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var distanceView: UIView! {
        didSet {
            distanceView.layer.cornerRadius = 10
            distanceView.layer.maskedCorners = [.layerMinXMinYCorner]
        }
    }
}
