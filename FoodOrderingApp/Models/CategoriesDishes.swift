//
//  CategoriesDishes.swift
//  FoodOrderingApp
//
//  Created by mac on 02/09/2022.
//

import Foundation

import Foundation

// MARK: - Welcome
struct CategoriesDishes: Codable {
    var status: Int?
    var message: String?
    var data: [Dish]?
}

// MARK: - Datum
struct Datum: Codable {
    var id, name, datumDescription: String?
    var image: String?
    var calories: Int?
    var category: Category?

    enum CodingKeys: String, CodingKey {
        case id, name
        case datumDescription = "description"
        case image, calories, category
    }
}

enum Category: String, Codable {
    case cat1 = "cat1"
}
