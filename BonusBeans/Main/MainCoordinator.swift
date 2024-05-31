//
//  MainCoordinator.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class MainCoordinator: Coordinator {

    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController()
        vc.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage.appImage(.search), tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    internal func pushCardInfo(item: KafeModel) {
        let vc = CardInfoViewController()
        vc.coordinator = self
        vc.kafe = item
        vc.hidesBottomBarWhenPushed = true
        navigationController.pushViewController(vc, animated: true)
    }
    
}
