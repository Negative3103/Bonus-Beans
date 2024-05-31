//
//  ProfileViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ProfileViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = ProfileView
    
    //MARK: - Services
    internal var coordinator: ProfileCoordinator?
    
    //MARK: - Attributes
    private let dataProvider = ProfileDataProvider()
    private var items = ReviewModel.items
    
    //MARK: - Actions
    @IBAction func subscribeActions(_ sender: UIButton) {
        coordinator?.pushSubscriptionViewController(viewController: self)
    }
    
    //MARK: - Lifecycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
}

//MARK: - Other funcs
extension ProfileViewController {
    private func appearanceSettings() {
        dataProvider.viewController = self
        dataProvider.collectionView = view().collectionView
        dataProvider.items = items
    }
}
