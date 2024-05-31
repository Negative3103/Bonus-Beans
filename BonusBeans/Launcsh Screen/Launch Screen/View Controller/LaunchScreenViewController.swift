//
//  LaunchScreenViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class LaunchScreenViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = LaunchScreenView
    
    //MARK: - Attributes
    override var prefersStatusBarHidden: Bool { return true }
    
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let phoneNumber = view().numberTextField.text?.origin(), phoneNumber.count == 12 else {
            showErrorAlert(message: "Введите номер телефона")
            return }
        let vc = ConfirmCodeViewController()
        vc.number = phoneNumber
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

// MARK: - Other funcs
extension LaunchScreenViewController {
    private func appearanceSettings() {
        view().numberTextField.delegate = self
        view().numberTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        textField.text = textField.text?.display()
        if textField.text?.origin().count == 13 { textField.text?.removeLast() }
    }
}

//MARK: - UITextFieldDelegate
extension LaunchScreenViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let start = textField.beginningOfDocument
        let cursorPosition = textField.position(from: start, offset: range.location)
        if let cursor = cursorPosition,
           textField.offset(from: start, to: cursor) <= 3 {
            return false
        }
        return true
    }
}
