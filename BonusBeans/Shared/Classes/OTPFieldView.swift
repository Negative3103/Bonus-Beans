//
//  OTPFieldView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

@objc public protocol OTPFieldViewDelegate: class {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool
    func enteredOTP(otp: String)
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool
}

@objc public enum DisplayType: Int {
    case circular
    case roundedCorner
    case square
    case diamond
    case underlinedBottom
}

@objc public enum KeyboardType: Int {
    case numeric
    case alphabet
    case alphaNumeric
}

@objc public class OTPFieldView: UIView {
    
    //MARK: - Services
    public var displayType: DisplayType = .circular
    public var fieldsCount: Int = 4
    public var otpInputType: KeyboardType = .numeric
    public var fieldFont: UIFont = UIFont.systemFont(ofSize: 20)
    public var secureEntry: Bool = false
    public var hideEnteredText: Bool = false
    public var requireCursor: Bool = true
    public var cursorColor: UIColor = UIColor.blue
    public var fieldSize: CGFloat = 100
    public var separatorSpace: CGFloat = 16
    public var fieldBorderWidth: CGFloat = 1
    public var shouldAllowIntermediateEditing: Bool = true
    public var defaultBackgroundColor: UIColor = UIColor.clear
    public var filledBackgroundColor: UIColor = UIColor.clear
    public var defaultBorderColor: UIColor = UIColor.gray
    public var filledBorderColor: UIColor = UIColor.clear
    public var errorBorderColor: UIColor?

    //MARK: - Attributes
    public weak var delegate: OTPFieldViewDelegate?
    fileprivate var secureEntryData = [String]()
    
    //MARK: - Lifecycles
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func initializeUI() {
        layer.masksToBounds = true
        layoutIfNeeded()
        initializeOTPFields()
        layoutIfNeeded()
        (viewWithTag(1) as? OTPTextField)?.becomeFirstResponder()
    }
    
    fileprivate func initializeOTPFields() {
        secureEntryData.removeAll()
        for index in stride(from: 0, to: fieldsCount, by: 1) {
            let oldOtpField = viewWithTag(index + 1) as? OTPTextField
            oldOtpField?.removeFromSuperview()
            
            let otpField = getOTPField(forIndex: index)
            addSubview(otpField)
            
            secureEntryData.append("")
        }
    }
    
    fileprivate func getOTPField(forIndex index: Int) -> OTPTextField {
        let hasOddNumberOfFields = (fieldsCount % 2 == 1)
        var fieldFrame = CGRect(x: 0, y: 0, width: fieldSize, height: fieldSize)
        
        if hasOddNumberOfFields {
            fieldFrame.origin.x = bounds.size.width / 2 - (CGFloat(fieldsCount / 2 - index) * (fieldSize + separatorSpace) + fieldSize / 2)
        } else {
            fieldFrame.origin.x = bounds.size.width / 2 - (CGFloat(fieldsCount / 2 - index) * fieldSize + CGFloat(fieldsCount / 2 - index - 1) * separatorSpace + separatorSpace / 2)
        }
        
        fieldFrame.origin.y = (bounds.size.height - fieldSize) / 2
        
        let otpField = OTPTextField(frame: fieldFrame)
        otpField.delegate = self
        otpField.tag = index + 1
        otpField.font = fieldFont
        
        switch otpInputType {
        case .numeric:
            otpField.keyboardType = .numberPad
        case .alphabet:
            otpField.keyboardType = .alphabet
        case .alphaNumeric:
            otpField.keyboardType = .namePhonePad
        }
        
        otpField.otpBorderColor = defaultBorderColor
        otpField.otpBorderWidth = fieldBorderWidth
        otpField.cornerRadiusItem = cornerRadius
        
        if requireCursor {
            otpField.tintColor = cursorColor
        } else {
            otpField.tintColor = UIColor.clear
        }
        
        otpField.backgroundColor = defaultBackgroundColor
        otpField.initalizeUI(forFieldType: displayType)
        
        return otpField
    }
    
    fileprivate func isPreviousFieldsEntered(forTextField textField: UITextField) -> Bool {
        var isTextFilled = true
        var nextOTPField: UITextField?
        if !shouldAllowIntermediateEditing {
            for index in stride(from: 1, to: fieldsCount + 1, by: 1) {
                let tempNextOTPField = viewWithTag(index) as? UITextField
                if let tempNextOTPFieldText = tempNextOTPField?.text, tempNextOTPFieldText.isEmpty {
                    nextOTPField = tempNextOTPField
                    break
                }
            }
            
            if let nextOTPField = nextOTPField {
                isTextFilled = (nextOTPField == textField || (textField.tag) == (nextOTPField.tag - 1))
            }
        }
        
        return isTextFilled
    }
    
    fileprivate func calculateEnteredOTPSTring(isDeleted: Bool) {
        if isDeleted {
            _ = delegate?.hasEnteredAllOTP(hasEnteredAll: false)
            for index in stride(from: 0, to: fieldsCount, by: 1) {
                var otpField = viewWithTag(index + 1) as? OTPTextField
                
                if otpField == nil {
                    otpField = getOTPField(forIndex: index)
                }
                
                let fieldBackgroundColor = (otpField?.text ?? "").isEmpty ? defaultBackgroundColor : filledBackgroundColor
                let fieldBorderColor = (otpField?.text ?? "").isEmpty ? defaultBorderColor : filledBorderColor
                
                if displayType == .diamond || displayType == .underlinedBottom {
                    otpField?.shapeLayer.fillColor = fieldBackgroundColor.cgColor
                    otpField?.shapeLayer.strokeColor = fieldBorderColor.cgColor
                } else {
                    otpField?.backgroundColor = fieldBackgroundColor
                    otpField?.layer.borderColor = fieldBorderColor.cgColor
                }
            }
        }
        else {
            var enteredOTPString = ""
            for index in stride(from: 0, to: secureEntryData.count, by: 1) {
                if !secureEntryData[index].isEmpty {
                    enteredOTPString.append(secureEntryData[index])
                }
            }
            
            if enteredOTPString.count == fieldsCount {
                delegate?.enteredOTP(otp: enteredOTPString)
                let isValid = delegate?.hasEnteredAllOTP(hasEnteredAll: (enteredOTPString.count == fieldsCount)) ?? false
                
                for index in stride(from: 0, to: fieldsCount, by: 1) {
                    var otpField = viewWithTag(index + 1) as? OTPTextField
                    
                    if otpField == nil {
                        otpField = getOTPField(forIndex: index)
                    }
                    
                    if !isValid {
                        otpField?.layer.borderColor = (errorBorderColor ?? filledBorderColor).cgColor
                    } else {
                        otpField?.layer.borderColor = filledBorderColor.cgColor
                    }
                }
            }
        }
    }
    
}

//MARK: - UITextFieldDelegate
extension OTPFieldView: UITextFieldDelegate {
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let shouldBeginEditing = delegate?.shouldBecomeFirstResponderForOTP(otpTextFieldIndex: (textField.tag - 1)) ?? true
        if shouldBeginEditing {
            return isPreviousFieldsEntered(forTextField: textField)
        }
        return shouldBeginEditing
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let replacedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        if !replacedText.isEmpty && otpInputType == .alphabet && replacedText.rangeOfCharacter(from: .letters) == nil {
            return false
        }
        
        if replacedText.count >= 1 {
            secureEntryData[textField.tag - 1] = string
            if hideEnteredText {
                textField.text = " "
            } else {
                if secureEntry {
                    textField.text = "•"
                } else {
                    textField.text = string
                }
            }
            
            if displayType == .diamond || displayType == .underlinedBottom {
                (textField as! OTPTextField).shapeLayer.fillColor = filledBackgroundColor.cgColor
                (textField as! OTPTextField).shapeLayer.strokeColor = filledBorderColor.cgColor
            } else {
                textField.backgroundColor = filledBackgroundColor
                textField.layer.borderColor = filledBorderColor.cgColor
            }
            
            let nextOTPField = viewWithTag(textField.tag + 1)
            
            if let nextOTPField = nextOTPField {
                nextOTPField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
            calculateEnteredOTPSTring(isDeleted: false)
        } else {
            let currentText = textField.text ?? ""
            if textField.tag > 1 && currentText.isEmpty {
                if let prevOTPField = viewWithTag(textField.tag - 1) as? UITextField {
                    deleteText(in: prevOTPField)
                }
            } else {
                deleteText(in: textField)
                if textField.tag > 1 {
                    if let prevOTPField = viewWithTag(textField.tag - 1) as? UITextField {
                        prevOTPField.becomeFirstResponder()
                    }
                }
            }
        }
        
        return false
    }
    
    private func deleteText(in textField: UITextField) {
        secureEntryData[textField.tag - 1] = ""
        textField.text = ""
        
        if displayType == .diamond || displayType == .underlinedBottom {
            (textField as! OTPTextField).shapeLayer.fillColor = defaultBackgroundColor.cgColor
            (textField as! OTPTextField).shapeLayer.strokeColor = defaultBorderColor.cgColor
        } else {
            textField.backgroundColor = defaultBackgroundColor
            textField.layer.borderColor = defaultBorderColor.cgColor
        }
        
        textField.becomeFirstResponder()
        calculateEnteredOTPSTring(isDeleted: true)
    }
}
