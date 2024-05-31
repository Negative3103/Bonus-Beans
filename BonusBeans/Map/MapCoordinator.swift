//
//  MapCoordinator.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class MapCoordinator: Coordinator {

    internal var childCoordinators = [Coordinator]()
    internal var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = QRCodeViewController()
        vc.tabBarItem = UITabBarItem(title: "QR-код", image: UIImage(systemName: "qrcode"), tag: 2)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
}
