//
//  KafeModel.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import Foundation

struct KafeModel {
    let name: String?
    let address: String?
    let rate: Double?
    let points: Int?
    
    init(name: String?, address: String?, rate: Double?, points: Int?) {
        self.name = name
        self.address = address
        self.rate = rate
        self.points = points
    }
    
    static let items: [KafeModel] = [
        KafeModel(name: "Caffelito", address: "Буюк ипа йули, 25", rate: 4.5, points: 14),
        KafeModel(name: "Coffe house", address: "ТТЗ-Автостанция", rate: 3.8, points: 23),
        KafeModel(name: "Safia", address: "Улица Ганга, 7", rate: 4.3, points: 42),
        KafeModel(name: "Giotto", address: "Ц-1 , 34", rate: 3.3, points: 33),
        KafeModel(name: "Black coffee", address: "Остановка Ц-5", rate: 2.4, points: 7),
        KafeModel(name: "Dream house", address: "Next-Mall", rate: 3.0, points: 29),
        KafeModel(name: "Vibe house", address: "Samarkand дарвоза", rate: 2.9, points: 5),
        KafeModel(name: "Кофе с собой", address: "Остановка Шахристанская", rate: 4.7, points: 34),
        KafeModel(name: "Beans", address: "Mega planet", rate: 0.0, points: 0),
        KafeModel(name: "Бразильское кофе", address: "Остановка Гафур-Гулям", rate: 1.8, points: 3),
        KafeModel(name: "Starbucks", address: "Ташкент-Сити Молл", rate: 4.9, points: 135),
    ]
}
