//
//  ConfirmCodeView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit
import KAPinField

final class ConfirmCodeView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var codeTextField: OTPFieldView!{
        didSet {
            codeTextField.fieldsCount = 5
            codeTextField.fieldBorderWidth = 1
            codeTextField.defaultBorderColor = UIColor.appColor(.black70)
            codeTextField.defaultBackgroundColor = UIColor.clear
            codeTextField.filledBackgroundColor = UIColor.clear
            codeTextField.filledBorderColor = UIColor.appColor(.black)
            codeTextField.cursorColor = UIColor.appColor(.orange)
            codeTextField.displayType = .roundedCorner
            codeTextField.fieldSize = 50
            codeTextField.backgroundColor = .clear
            codeTextField.cornerRadius = 10
            codeTextField.otpInputType = .numeric
            codeTextField.separatorSpace = 12
            codeTextField.shouldAllowIntermediateEditing = false
            codeTextField.initializeUI()
        }
    }
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
            cancelButton.setBorder(enable: true, borderWidth: 1)
        }
    }
}
