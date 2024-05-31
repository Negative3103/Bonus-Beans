//
//  ReviewCoordinator.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ReviewCoordinator: Coordinator {

    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ReviewViewController()
        vc.tabBarItem = UITabBarItem(title: "Обзор", image: UIImage.appImage(.review), tag: 1)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
