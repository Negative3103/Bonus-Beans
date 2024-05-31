//
//  ReviewCollectionViewCell.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ReviewCollectionViewCell: CustomCollectionViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //MARK: - Attributes
    internal var item: ReviewModel? {
        didSet {
            guard let item = item else { return }
            
            if let name = item.name {
                titleLabel.text = name
            }
            
            if let address = item.address {
                addressLabel.text = address
            }
            
            if let time = item.time {
                timeLabel.text = time
            }
            
            if let distance = item.distance {
                locationLabel.text = distance > 10 ? String(distance) + "м" : String(distance) + "км"
            }
        }
    }
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 10
    }
}
