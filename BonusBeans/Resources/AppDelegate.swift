//
//  AppDelegate.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // MARK: - Attributes
    internal var orientationLock = UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .appColor(.mainBackground)
        window?.rootViewController = UINavigationController(rootViewController: LaunchScreenViewController())
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return orientationLock
    }

}

