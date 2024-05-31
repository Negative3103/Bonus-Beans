//
//  KafeTableViewCell.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class KafeTableViewCell: CustomTableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    //MARK: - Attributes
    internal var item: KafeModel? {
        didSet {
            guard let item = item else { return }
            
            if let name = item.name {
                nameLabel.text = name
            }
            
            if let address = item.address {
                addressLabel.text = address
            }
            
            if let rate = item.rate {
                rateLabel.text = "Рейтинг: " + String(rate)
            }
            
            if let points = item.points {
                pointsLabel.text = String(points) + " оценок"
            }
        }
    }
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
