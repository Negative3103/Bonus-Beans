//
//  UINavigationBar.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

extension UINavigationBar {
    func installBlurEffect() {
        tintColor = .appColor(.black)
        titleTextAttributes = [.foregroundColor: UIColor.appColor(.black)]
        largeTitleTextAttributes = [.foregroundColor: UIColor.appColor(.black)]
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .highlighted)
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
        
        let backButton = BackBarButtonItem()
        backButton.title = ""
        backButton.tintColor = UIColor.appColor(.black)
        topItem?.backBarButtonItem = backButton
    }
    
    func clear() {
        shadowImage = UIImage()
        setBackgroundImage(UIImage(), for: .default)
    }
    
    func reset() {
        shadowImage = nil
        setBackgroundImage(nil, for: .default)
    }
}

class BackBarButtonItem: UIBarButtonItem {
    @available(iOS 14.0, *)
    override var menu: UIMenu? {
        set {}
        get {
            return super.menu
        }
    }
}
