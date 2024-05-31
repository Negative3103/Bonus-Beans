//
//  ReviewViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class ReviewViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = ReviewView
    
    //MARK: - Services
    internal var coordinator: ReviewCoordinator?
    
    //MARK: - Attributes
    private let dataProvider = ReviewDataProvider()
    private let items = ReviewModel.items
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

//MARK: - Other funcs
extension ReviewViewController {
    private func appearanceSettings() {
        navigationItem.title = "Обзор"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.clear()
        navigationController?.navigationBar.installBlurEffect()
        dataProvider.viewController = self
        dataProvider.collectionView = view().collectionView
        dataProvider.items = items
    }
}
