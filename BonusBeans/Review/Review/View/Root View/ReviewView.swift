//
//  ReviewView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ReviewView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: ReviewCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ReviewCollectionViewCell.defaultReuseIdentifier)
        }
    }
    
}
