//
//  ConfirmCodeViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ConfirmCodeViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = ConfirmCodeView
    
    //MARK: - Attributes
    internal var code: String?
    internal var number: String? {
        didSet {
            guard let number = number else { return }
            view().numberLabel.text = "Код был отправлен на +\(number)"
            UserDefaults.standard.setValue(number, forKey: "phone")
        }
    }
    
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            showSuccessAlert(message: "Код был отправлен повторно")
        case 1:
            guard let code = code, !code.isEmpty else {
                showErrorAlert(message: "Введите код!")
                return
            }
            showSuccessAlert()
            dismiss(animated: true) {
                self.resetTabBar()
            }
        case 2:
            dismiss(animated: true)
        default: break
        }
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

//MARK: - Other funcs
extension ConfirmCodeViewController {
    private func appearanceSettings() {
        view().codeTextField.delegate = self
    }
}

// MARK: - OTP Delegate
extension ConfirmCodeViewController: OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        code = otp
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        return true
    }
}
