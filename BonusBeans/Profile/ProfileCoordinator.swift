//
//  ProfileCoordinator.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit
import SwiftMessages

final class ProfileCoordinator: Coordinator {

    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ProfileViewController()
        vc.tabBarItem = UITabBarItem(title: "Кабинет", image: UIImage.appImage(.profile), tag: 3)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    internal func pushSubscriptionViewController(viewController: UIViewController) {
        let vc = SubscribeViewController()
        vc.coordinator = self
        let segue = SwiftMessagesSegue(identifier: nil, source: viewController, destination: vc)
        segue.configure(layout: .bottomCard)
        segue.messageView.backgroundHeight = 340
        segue.perform()
    }
    
}
