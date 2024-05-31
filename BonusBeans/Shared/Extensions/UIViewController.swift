//
//  UIViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

extension UIViewController {
    func resetTabBar() {
        let window = UIApplication.shared.windows[0] as UIWindow
        let tabBar = TabBarController()
        if let index = self.tabBarController?.selectedIndex {
            tabBar.selectedIndex = index
        }
        window.rootViewController = tabBar
    }
    
    @objc open func dismissKeyboard() {
        view.endEditing(true)
    }
}
