//
//  CategoriesModel.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import UIKit

struct CategoriesModel {
    let id: Int?
    let title: String?
    
    init(id: Int?, title: String?) {
        self.id = id
        self.title = title
    }
    
    static let items: [CategoriesModel] = [
        CategoriesModel(id: 0, title: "Обзор"),
        CategoriesModel(id: 1, title: "Меню"),
        CategoriesModel(id: 2, title: "Отзывы"),
    ]
}
