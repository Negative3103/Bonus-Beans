//
//  TabBarController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit
import Haptica

final class TabBarController: UITabBarController {
    
    // MARK: - Attributes
    internal var mainCoordinator = MainCoordinator(navigationController: UINavigationController())
    internal var categoriesCoordinator = ReviewCoordinator(navigationController: UINavigationController())
    internal var searchCoordinator = MapCoordinator(navigationController: UINavigationController())
    internal var profileCoordinator = ProfileCoordinator(navigationController: UINavigationController())
    
    // MARK: - Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        createControllers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createControllers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

// MARK: - Other funcs
extension TabBarController {
    private func createControllers() {
        mainCoordinator.start()
        categoriesCoordinator.start()
        searchCoordinator.start()
        profileCoordinator.start()
        
        viewControllers = [mainCoordinator.navigationController, categoriesCoordinator.navigationController, searchCoordinator.navigationController, profileCoordinator.navigationController]
    }
    
    private func appearanceSettings() {
        self.delegate = self
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(astroButtonItemLongPressed(_:)))
        tabBar.addGestureRecognizer(longPressRecognizer)
        tabBar.tintColor = UIColor.appColor(.black)
        tabBar.isTranslucent = true
        tabBar.layer.cornerRadius = 20
        tabBar.clipsToBounds = true
    }
    
    @objc func astroButtonItemLongPressed(_ recognizer: UILongPressGestureRecognizer) {
        guard recognizer.state == .began else { return }
        guard let tabBar = recognizer.view as? UITabBar else { return }
        guard let tabBarItems = tabBar.items else { return }
        guard let viewControllers = viewControllers else { return }
        guard tabBarItems.count == viewControllers.count else { return }
        
        let loc = recognizer.location(in: tabBar)
        for item in tabBarItems {
            guard let view = item.value(forKey: "view") as? UIView else { continue }
            guard view.frame.contains(loc) else { continue }
            animationItem(item: item, time: 0.6)
            break
        }
    }
    
    func animationItem(item: UITabBarItem, time: Double = 0.3) {
        guard let barItemView = item.value(forKey: "view") as? UIView else { return }
        
        let timeInterval: TimeInterval = time
        let propertyAnimator = UIViewPropertyAnimator(duration: timeInterval, dampingRatio: 0.5) {
            barItemView.transform = CGAffineTransform.identity.scaledBy(x: 0.9, y: 0.9)
        }
        propertyAnimator.addAnimations({ barItemView.transform = .identity }, delayFactor: CGFloat(timeInterval))
        propertyAnimator.startAnimation()
        
        Haptic.selection.generate()
    }
}

// MARK: - Delegate
extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        animationItem(item: item)
    }
}
