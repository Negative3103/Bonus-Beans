//
//  SubscribeViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class SubscribeViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = SubscribeView
    
    //MARK: - Services
    internal var coordinator: ProfileCoordinator?
    
    //MARK: - Attributes
    
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        addCard()
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

//MARK: - Other funcs
extension SubscribeViewController {
    private func appearanceSettings() {
        view().cardTextField.delegate = self
        view().dateTextField.delegate = self
        view().dateTextField.addTarget(self, action: #selector(textFieldDidChangeDate(_:)), for: .editingChanged)
    }
    
    private func addCard() {
        guard let card = view().cardTextField.text?.replacingOccurrences(of: " ", with: "") else { return }
        guard let cardText = view().cardTextField.text, !cardText.isEmpty,
              let dateText = view().dateTextField.text, !dateText.isEmpty,
              card.count == 16, dateText.count == 5
        else {
            showErrorAlert(message: "Заполните все поля!")
            return
        }
        showSuccessAlert(message: "Вы успешно приобрели подписку")
        UserDefaults.standard.setValue(true, forKey: "hasSubs")
        dismiss(animated: true)
    }
}

//MARK: - UITextField Delegate
extension SubscribeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        if textField == view().cardTextField {
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            textField.text?.formatPhoneNumber(with: "XXXX XXXX XXXX XXXX", phone: newString)
            return false
        }else {
            return true
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        textField.text = textField.text?.display()
    }
    
    @objc func textFieldDidChangeDate(_ textField: UITextField) {
        textField.text = textField.expairDateFormatter(expairDateString: textField.text!)
    }
}
