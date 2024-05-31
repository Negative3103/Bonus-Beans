//
//  QRCodeView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class QRCodeView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var qrCodeImageView: UIImageView! {
        didSet {
            qrCodeImageView.layer.cornerRadius = 10
        }
    }
}
