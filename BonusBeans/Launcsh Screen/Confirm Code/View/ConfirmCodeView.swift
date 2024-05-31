//
//  ConfirmCodeView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ConfirmCodeView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var resendCodeButton: UIButton!
    @IBOutlet weak var acceptButton: HighlightButton! {
        didSet {
            acceptButton.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.layer.cornerRadius = 10
        }
    }
}
