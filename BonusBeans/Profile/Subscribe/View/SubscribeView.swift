//
//  SubscribeView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class SubscribeView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var button: HighlightButton! {
        didSet {
            button.layer.cornerRadius = 10
        }
    }
}
