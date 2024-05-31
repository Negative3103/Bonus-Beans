//
//  CardInfoViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class CardInfoViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = CardInfoView
    
    //MARK: - Services
    internal var coordinator: MainCoordinator?
    
    //MARK: - Attributes
    private let dataProvider = CategoriesDataProvider()
    private let reviewDataProvider = ReviewDataProvider()
    private let items = CategoriesModel.items
    private let review = ReviewModel.items
    internal var kafe: KafeModel?
    internal var selectedCategory: CategoriesModel? {
        didSet {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let `self` = self else { return }
                guard let selectedCategory = selectedCategory, let id = selectedCategory.id else { return }
                view().reviewView.alpha = 0
                view().reviewView.isHidden = true
                view().menuView.alpha = 0
                view().menuView.isHidden = true
                switch id {
                case 0:
                    view().reviewView.isHidden = false
                    view().reviewView.alpha = 1
                case 1:
                    view().menuView.isHidden = false
                    view().menuView.alpha = 1
                case 2:
                    break
                default:
                    break
                }
            }
            view().layoutIfNeeded()
        }
    }
    
    //MARK: - Actions
    @IBAction func buttonAction(_ sender: UIButton) {
        
    }
    
    //MARK: - Lifecycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.reset()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.clear()
    }

}

//MARK: - Other funcs
extension CardInfoViewController {
    private func appearanceSettings() {
        navigationItem.title = "Информация"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.installBlurEffect()
        dataProvider.viewController = self
        dataProvider.collectionView = view().categoriesCollectionView
        dataProvider.items = items
        reviewDataProvider.viewController = self
        reviewDataProvider.collectionView = view().collectionView
        reviewDataProvider.items = review
    }
}
