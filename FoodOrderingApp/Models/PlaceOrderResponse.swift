//
//  PlaceOrderResponse.swift
//  FoodOrderingApp
//
//  Created by mac on 31/08/2022.
//

import Foundation
struct PlaceOrderResponse : Codable {
    var status: Int?
       var message: String?
       var data: DataClass?
   }

   // MARK: - DataClass
   struct DataClass: Codable {
       var id, name: String?
       var dish: Dish1?
   }

//   // MARK: - Dish
   struct Dish1: Codable {
       var id, name, dishDescription: String?
       var image: String?
       var calories: Int?
       var category: String?

       enum CodingKeys: String, CodingKey {
           case id, name
           case dishDescription = "description"
           case image, calories, category
       }
   }
