//
//  KafeTableViewCell.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class KafeTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    //MARK: - Lifecycles
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
