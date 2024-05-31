//
//  MainViewController.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class MainViewController: UIViewController, AlertViewController, ViewSpecificController {
    
    //MARK: - Root View
    typealias RootView = MainView
    
    //MARK: - Services
    internal var coordinator: MainCoordinator?
    
    //MARK: - Atributes
    weak var searchController: UISearchController?
    internal var dataProvider = MainDataProvider()
    private var items = KafeModel.items
    
    //MARK: - Actions
    @objc func clear(_ searchBar: UISearchBar) {
        navigationItem.searchController?.isActive = false
        dataProvider.items.removeAll()
    }
    
    @objc func keyboardWillDisappear() {
        guard dataProvider.items.isEmpty else { return }
        navigationItem.searchController?.isActive = false
    }
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        appearanceSettings()
    }
}

//MARK: - Other funcs
extension MainViewController {
    private func appearanceSettings() {
        navigationItem.title = "Поиск"
        dataProvider.viewController = self
        dataProvider.tableView = view().tableView
        dataProvider.items = items
        navigationController?.navigationBar.installBlurEffect()
        setupSearchBar()
        setupClearAction()
        setupGesture()
    }
    
    private func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.searchController = view().searchController
        if #available(iOS 16.0, *) {
          navigationItem.preferredSearchBarPlacement = .stacked
        }
        view().searchController.searchBar.delegate = self
        view().searchController.searchResultsUpdater = self
    }
    
    private func setupClearAction() {
        if let searchTextField = view().searchController.searchBar.value(forKey: "searchField") as? UITextField , let clearButton = searchTextField.value(forKey: "_clearButton")as? UIButton {
            clearButton.addTarget(self, action: #selector(clear), for: .touchUpInside)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissSearchKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissSearchKeyboard() {
        view.endEditing(true)
        view().searchController.searchBar.resignFirstResponder()
    }
}

//MARK: - UISearchBarDelegate
extension MainViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        guard searchText.trimmingCharacters(in: .whitespaces) != "" else { 
            dataProvider.items = items
            return }
        dataProvider.items = dataProvider.items.filter {
            guard let title = $0.name else { return false }
            return title.lowercased().contains(searchText.lowercased())
        }
        dataProvider.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dataProvider.items = items
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
}
