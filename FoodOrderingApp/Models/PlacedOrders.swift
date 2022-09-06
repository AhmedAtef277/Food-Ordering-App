//
//  PlacedOrders.swift
//  FoodOrderingApp
//
//  Created by mac on 02/09/2022.
//

import Foundation
struct PlacedOrders: Codable {
    let status: Int?
    let message: String?
    let data: [Orders]?
}

// MARK: - Datum
//struct Datum: Codable {
//    let id, name: String?
//    let dish: Dish?
//}

// MARK: - Dish
//struct Dish: Codable {
//    let id, name, dishDescription: String?
//    let image: String?
//    let calories: Int?
//    let category: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case dishDescription
//        case image, calories, category
//    }
//}
