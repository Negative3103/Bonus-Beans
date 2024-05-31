//
//  LaunchScreenView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class LaunchScreenView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var button: HighlightButton! {
        didSet {
            button.layer.cornerRadius = 10
        }
    }
}
