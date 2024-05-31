//
//  UITextField.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

extension UITextField {
    func expairDateFormatter(expairDateString : String) -> String {
         let trimmedString = expairDateString.components(separatedBy: "/").joined()

         let arrOfCharacters = Array(trimmedString)
         var modifiedCreditCardString = ""

         if(arrOfCharacters.count > 0) {
             for i in 0...arrOfCharacters.count-1 {
                 modifiedCreditCardString.append(arrOfCharacters[i])
                 if((i+1) % 2 == 0 && i+1 != arrOfCharacters.count){
                     modifiedCreditCardString.append("/")
                 }
                 
                 if modifiedCreditCardString.count == 6 {
                     modifiedCreditCardString.removeLast()
                 }
             }
         }
         return modifiedCreditCardString
     }
}
