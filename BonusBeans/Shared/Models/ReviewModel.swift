//
//  ReviewModel.swift
//  BonusBeans
//
//  Created by Хасан Давронбеков on 31/05/24.
//

import Foundation

struct ReviewModel {
    let name: String?
    let address: String?
    let time: String?
    let distance: Double?
    
    init(name: String?, address: String?, time: String?, distance: Double?) {
        self.name = name
        self.address = address
        self.time = time
        self.distance = distance
    }
    
    static let items: [ReviewModel] = [
        ReviewModel(name: "Caffelito", address: "Буюк ипа йули, 25", time: "Открыто до 23:00", distance: 250),
        ReviewModel(name: "Coffe house", address: "ТТЗ-Автостанция", time: "Открыто до 22:00", distance: 300),
        ReviewModel(name: "Safia", address: "Улица Ганга, 7", time: "Круглосуточно", distance: 1),
        ReviewModel(name: "Giotto", address: "Ц-1 , 34", time: "Открыто до 24:00", distance: 1.5),
        ReviewModel(name: "Black coffee", address: "Остановка Ц-5", time: "Открыто до 21:00", distance: 3),
        ReviewModel(name: "Dream house", address: "Next-Mall", time: "Круглосуточно", distance: 2),
        ReviewModel(name: "Vibe house", address: "Samarkand дарвоза", time: "Круглосуточно", distance: 3.3),
        ReviewModel(name: "Кофе с собой", address: "Остановка Шахристанская", time: "Открыто до 19:00", distance: 1),
        ReviewModel(name: "Beans", address: "Mega planet", time: "Открыто до 20:00", distance: 400),
        ReviewModel(name: "Бразильское кофе", address: "Остановка Гафур-Гулям", time: "Открыто до 20:00", distance: 2),
        ReviewModel(name: "Starbucks", address: "Ташкент-Сити Молл", time: "Круглосуточно", distance: 56),
    ]
}
