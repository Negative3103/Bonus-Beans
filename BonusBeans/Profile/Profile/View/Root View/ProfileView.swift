//
//  ProfileView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ProfileView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(UINib(nibName: ReviewCollectionViewCell.defaultReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: ReviewCollectionViewCell.defaultReuseIdentifier)
        }
    }
    @IBOutlet weak var numberLabel: UILabel! {
        didSet {
            numberLabel.text = "+" + (UserDefaults.standard.string(forKey: "phone") ?? "")
        }
    }
    @IBOutlet weak var subscribeButton: HighlightButton! {
        didSet {
            subscribeButton.layer.cornerRadius = 10
        }
    }
}
