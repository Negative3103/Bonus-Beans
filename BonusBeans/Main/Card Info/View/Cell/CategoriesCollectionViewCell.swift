//
//  CategoriesCollectionViewCell.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class CategoriesCollectionViewCell: CustomCollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    
    //MARK: - Attributes
    internal var item: CategoriesModel? {
        didSet {
            guard let item = item else { return }
            
            if let title = item.title {
                titleLabel.text = title
            }
        }
    }
    
    internal var didSelect: Bool = false {
        didSet {
            titleLabel.textColor = didSelect ? .appColor(.black) : .appColor(.black70)
            selectedView.isHidden = !didSelect
        }
    }
}
