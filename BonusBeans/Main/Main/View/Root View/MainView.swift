//
//  MainView.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

final class MainView: CustomView {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView! {
        
    }
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        let searchBar = searchController.searchBar
        
        searchBar.placeholder = "Поиск"
        
        var searchTextField: UITextField
        
        if #available(iOS 13.0, *) {
            searchTextField = searchBar.searchTextField
        } else {
            searchTextField = searchController.searchBar.value(forKey: "_searchField") as! UITextField
            UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
        
        searchTextField.textColor = .white
        searchTextField.tintColor = .appColor(.cl_brand)

        let glassIconView = searchTextField.leftView as? UIImageView
        glassIconView?.image = glassIconView?.image?.withRenderingMode(.alwaysTemplate)
        glassIconView?.tintColor = .white
        
        return searchController
    }()}
